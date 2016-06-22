class FirstContactFilesController < ApplicationController

  def index
    @first_contact_files = FirstContactFile.all.paginate( :page => params[ :page ] )
  end

  def new
    @first_contact_file = FirstContactFile.new(
      is_new_partner: true,
      beneficiary: Beneficiary.new(person: Person.new),
      support: Person.new(phones: [Phone.new]),
      date: Date.today.strftime('%d/%m/%Y'),
      contact_source: Person.new(phones: [Phone.new]))
  end

  def create
  end

end
