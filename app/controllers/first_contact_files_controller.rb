class FirstContactFilesController < ApplicationController

  def index
    @first_contact_files = FirstContactFile.all.paginate( :page => params[ :page ] )
  end

  def new
    @first_contact_file = FirstContactFile.new
  end

  def create
    p params
  end

end
