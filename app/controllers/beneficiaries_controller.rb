class BeneficiariesController < ApplicationController
  def new
    @beneficiary = Beneficiary.new(person: Person.new)
  end
end
