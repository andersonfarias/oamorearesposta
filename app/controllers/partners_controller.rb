class PartnersController < ApplicationController
    respond_to :html, :xml, :json

    before_action :set_partner, only: [:show, :edit, :update, :destroy]

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
        authorize @partner

        @partner.contact_person_2 = nil unless given_second_contact(partner_params)

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
        if @partner.update(partner_params)
            redirect_to @partner, notice: t('controllers.actions.update.success', model: Partner.model_name.human(count: 1))
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
            :id, :fantasy_name, :cnpj, :partner_type, work_areas: [],
            person_attributes: [
                :id, :first_name, :email, phones_attributes: [:id, :number],
                                          address_attributes: [:id, :street, :number, :neighborhood, :cep, :city_id, :complement]
            ],
            contact_person_1_attributes: [:id, :first_name, :email, phones_attributes: [:id, :number]],
            contact_person_2_attributes: [:id, :first_name, :email, phones_attributes: [:id, :number]]
        )
    end

    def given_second_contact(params)
        return false unless params.key?(:partner)
        return false unless params[:partner].key?(:contact_person_2_attributes)

        [:id, :first_name, :email, :phones_attributes].each do |attr|
            if params[:partner][:contact_person_2_attributes].key?(attr)
                return true unless blank?(params[:partner][:contact_person_2_attributes].key?(attr))
            end
        end
        false
    end
end
