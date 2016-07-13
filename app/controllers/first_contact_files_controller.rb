class FirstContactFilesController < ApplicationController

	before_action :set_file, only: [:show, :edit, :update]

	def index
		@first_contact_files = FirstContactFile.all.paginate( :page => params[ :page ] )
	end

	def show
	end

	def new
		@first_contact_file = FirstContactFile.new(
			is_new_partner: true,
			beneficiary: Beneficiary.new(person: Person.new(address: Address.new())),
			support: Person.new(phones: [Phone.new], age: 0),
			date: Date.today.strftime(t "date.formats.default"),
			contact_source: Person.new(phones: [Phone.new], age: 0))
	end

	def edit
		@first_contact_file.date = @first_contact_file.date.strftime('%d/%m/%Y')
	end

	def create
		@first_contact_file = current_user.first_contact_files.new(form_params)
		if @first_contact_file.save
			redirect_to @first_contact_file,
				notice: t('controllers.actions.create.success', model: FirstContactFile.model_name.human(count: 1))
		else
			render 'new', notice: @first_contact_file.errors
		end
	end

	def update
		if @first_contact_file.update(form_params)
			redirect_to @first_contact_file,
				notice: t('controllers.actions.update.success', model: FirstContactFile.model_name.human(count: 1))
		else
			render 'edit', notice: @first_contact_file.errors
		end

	end

	private
	def set_file
		@first_contact_file = FirstContactFile.find(params[:id])
	end

	def form_params
		params.require(:first_contact_file).permit(
			:date, :hour, :institution, :operational_context_first_contact,
			:how_established_first_contact, :contact_source_type,
			:how_person_knew_about_the_organization,
			:beneficiary_and_contact_source_relationship,
			:is_new_partner, :number_of_previous_treatments,
			:place_of_previous_treatments, :marital_status,
			:number_sons, :number_daughters, :ethnic_group, :religion,
			:family_structure, :job, :comments, :user,
			:education_levels => [],
			:answer => [],
			:petitions => [],
			:results => [],
			:first_contact_conditions => [],
			:beneficiary_attributes => [
				:id,
				:department_id,
				:person_attributes => [
					:id,
					:first_name,
					:last_name,
					:birthdate,
					:age,
					:gender,
					:email,
					:address_attributes => [
						:id,
						:street,
						:neighborhood,
						:number,
						:cep,
						:complement,
						:city_id
					]
				],
			],
			:contact_source_attributes => [
				:id,
				:first_name,
				:age,
				:gender,
				[:phones_attributes => [:id, :number]]
			],
			:support_attributes => [
				:id,
				:first_name,
				[:phones_attributes => [:id, :number]]
		])
	end

end
