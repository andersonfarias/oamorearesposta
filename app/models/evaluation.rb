class Evaluation < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :beneficiary, optional: true
  belongs_to :problems_during_process, optional: true
  belongs_to :dependent_variable, optional: true
  belongs_to :independent_variable, optional: true

  accepts_nested_attributes_for :beneficiary
  accepts_nested_attributes_for :problems_during_process
  accepts_nested_attributes_for :dependent_variable
  accepts_nested_attributes_for :independent_variable

  enum ops: [:'0', :'1', :'2', :'3', :'4', :'5', :x]

  def self.search_result params
    result = Evaluation.where(is_active: true)

    if !params[:number].blank?
        result = result.select {|e| e.number == params[:number]}
    end

    if !params[:beneficiary_name].blank?
        result = result.select {|e| e.beneficiary.person.full_name.upcase.include? params[:beneficiary_name].upcase }
    end

    if !params[:initial_date].blank?
        result = result.select {|e| e.evaluation_date >= params[:initial_date].to_datetime}
    end

    if !params[:final_date].blank?
        result = result.select {|e| e.evaluation_date <= params[:final_date].to_datetime}
    end
    result
  end
  
end
