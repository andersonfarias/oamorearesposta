class BeneficiariesController < ApplicationController
  def new
    @beneficiary = Beneficiary.new(person: Person.new(address: Address.new()))
  end

  def index
    @beneficiaries = Beneficiary.all.paginate( :page => params[ :page ] )
  end
end
