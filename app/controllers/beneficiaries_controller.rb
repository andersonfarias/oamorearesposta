class BeneficiariesController < ApplicationController
  def new
    @beneficiary = Beneficiary.new(person: Person.new(address: Address.new()))
  end
end
