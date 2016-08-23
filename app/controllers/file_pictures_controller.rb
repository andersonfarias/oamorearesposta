class FilePicturesController < ApplicationController
	before_action :set_file, only: [:show]

	def show
		send_data(@file.file_contents,
			type: @file.content_type,
			filename: @file.file_name)
	end

	def index
	    @files = FilePicture.all
	end

	private
	def set_file
		@file = FilePicture.find(params[:id])
	end
end
