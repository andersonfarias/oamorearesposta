class FirstContactFilesController < ApplicationController

  def index
    @first_contact_files = FirstContactFile.all.paginate( :page => params[ :page ] )
  end

  def new
    @contact_source = Person.new
    # @support = Person.new
    @first_contact_file = FirstContactFile.new(
      is_new_partner: true,
      # support: @support,
      contact_source: @contact_source)
  end

  def create
  end

end
