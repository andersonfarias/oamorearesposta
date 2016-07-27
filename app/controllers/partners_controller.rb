class PartnersController < ApplicationController
    respond_to :html, :xml, :json

    before_action :set_partner, only: [:show, :edit, :update, :destroy]

    def autocomplete_partner_name
        render json: to_autocomplete_items(Partner.by_name_and_status(person_name: params[:q]))
    end

    def index
        authorize current_user
        @partners = Partner.by_name_and_status(params).paginate(page: params[:page])
    end

    def show
        authorize @partner
    end

    def new
        @partner = Partner.new(
            person: Person.new(address: Address.new, phones: [Phone.new], age: 0),
            contact_person_1: Person.new(address: Address.new, phones: [Phone.new], age: 0),
            contact_person_2: Person.new(address: Address.new, phones: [Phone.new], age: 0)
        )

        authorize @partner
    end

    def create
        @partner = Partner.new(partner_params)
        @partner.contact_person_2 = nil if partner_params[:contact_person_2_attributes][:first_name].blank?

        authorize @partner
        if @partner.save
            redirect_to @partner, notice: t('controllers.actions.create.success', model: Partner.model_name.human(count: 1))
        else
            render 'new'
        end
    end

    def edit
        authorize @partner

        if @partner.contact_person_2.nil?
            @partner.contact_person_2 = Person.new(address: Address.new, phones: [Phone.new], age: 0)
        end
    end

    def update
        authorize @partner
        update_second_contact_partner(params) if params[:partner][:contact_person_2_attributes][:first_name].blank?
        if @partner.update(partner_params)
            redirect_to @partner, notice: t('controllers.actions.update.success', model: Partner.model_name.human(count: 1))
        else
            render 'edit'
        end
       
    end

    def destroy
        authorize @partner
        @partner.is_active = false
        if @partner.save
            redirect_to partners_path, notice: t('controllers.actions.destroy.success', model: Partner.model_name.human(count: 1))
        end
    end

    private

    def set_partner
        @partner = Partner.find(params[:id])
    end

    def partner_params
        params.require(:partner).permit(
            :id, :fantasy_name, :cnpj, :partner_type, :contact_person_2_id, work_areas: [],
            person_attributes: [
                :id, :first_name, :email, phones_attributes: [:id, :number],
                                          address_attributes: [:id, :street, :number, :neighborhood, :cep, :city_id, :complement]
            ],
            contact_person_1_attributes: [:id, :first_name, :email, phones_attributes: [:id, :number]],
            contact_person_2_attributes: [:id, :first_name, :email, phones_attributes: [:id, :number]]
        )
    end

    def update_second_contact_partner params
        partner_id = params[:partner][:contact_person_2_attributes][:id]
        params[:partner].except!(:contact_person_2_attributes) 
        params[:partner][:contact_person_2_id] = nil
        Person.find(partner_id).destroy
    end

    def to_autocomplete_items items
        items.collect do |item|
            [item.id.to_s, item.to_s]
        end
    end
end
