class Beneficiary < ApplicationRecord
    belongs_to :department, optional: true
    belongs_to :person, dependent: :destroy, optional: true
    has_one :first_contact_file, inverse_of: :beneficiary, dependent: :destroy
    has_many :clinic_treatments, dependent: :destroy
    has_many :attendances
    has_many :activity_diaries, through: :attendances
    has_many :ppcls, dependent: :destroy
    has_many :evaluations, dependent: :destroy

    accepts_nested_attributes_for :person

    validates_associated :person, :department
    validates_presence_of :person, :department, :first_contact_file

    def to_s
        full_name
    end

    def name
        person.first_name
    end

    def full_name
        person.full_name
    end

    def self.by_name_and_status(params)
        args = { name: "%#{params[:person_name]}%", active: true }
        Beneficiary.joins(:person).where(['(LOWER(people.first_name) || \' \' || LOWER(people.last_name) ) LIKE LOWER( :name ) AND is_active = :active', args]).order('people.first_name')
    end

    def self.by_code_name_and_department(params)
        code_condition = ''
        unless params['beneficiary_id'].blank?
            code_condition = "beneficiaries.id = #{params['beneficiary_id']} AND "
        end

        if params[:is_active].nil? || params[:is_active].empty?
            Beneficiary.joins(:department, :person).where(["#{code_condition}LOWER(people.first_name) LIKE LOWER('%#{params[:beneficiary_first_name]}%')
      					AND LOWER(people.last_name) LIKE LOWER('%#{params[:beneficiary_last_name]}%')
      					AND LOWER(departments.name) LIKE LOWER('%#{params[:department_name]}%') AND beneficiaries.is_active = :active", { active: true }])
        else
            Beneficiary.joins(:department, :person).where(["#{code_condition}LOWER(people.first_name) LIKE LOWER('%#{params[:beneficiary_first_name]}%')
      					AND LOWER(people.last_name) LIKE LOWER('%#{params[:beneficiary_last_name]}%')
      					AND LOWER(departments.name) LIKE LOWER('%#{params[:department_name]}%') AND beneficiaries.is_active = :active", { active: params[:is_active].to_bool }])
        end
    end

    def self.report_search params
        simple_params = %w(
            people.gender 
            people.age 
            first_contact_files.hour 
            first_contact_files.marital_status 
            first_contact_files.how_established_first_contact)
        
        enumerize_params = %w(
            first_contact_files.education_levels 
            first_contact_files.first_contact_conditions 
            first_contact_files.results 
            first_contact_files.answer)

        seach_enumerize = []
        simple_search = Hash.new
        params.each do |p| 
            seach_enumerize << p if enumerize_params.include? p[0] and p[1].present?
            if p[0] == "first_contact_files.hour" and p[1].present?
                simple_search[p[0]] = FirstContactFile.hours[p[1]]
            else
                simple_search[p[0]] = p[1] if simple_params.include? p[0] and p[1].present?
            end
        end
        sql_seach = seach_enumerize.map {|k,v| "#{k} LIKE '%#{v}%'" }.join(" AND ")

        result = Beneficiary.select(:id, 
                                    :"people.first_name", 
                                    :"people.last_name", 
                                    :"people.gender", 
                                    :"first_contact_files.date", 
                                    :"first_contact_files.answer",
                                    :"first_contact_files.results",
                                    :"first_contact_files.marital_status",
                                    :"first_contact_files.education_levels",
                                    :"first_contact_files.how_established_first_contact",
                                    :"first_contact_files.first_contact_conditions")
                .joins(:first_contact_file, :person).where(simple_search).where(sql_seach)

        if !params[:initial_date].blank?
            result = result.select {|b| b.date >= params[:initial_date].to_datetime}
        end

        if !params[:final_date].blank?
            result = result.select {|b| b.date <= params[:final_date].to_datetime}
        end

        result
    end
end
