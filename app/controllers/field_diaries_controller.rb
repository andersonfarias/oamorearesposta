class FieldDiariesController < ApplicationController
  before_action :set_field_diary, only: [:show, :edit, :update, :destroy]

  # GET /field_diaries
  # GET /field_diaries.json
  def index
    @field_diaries = FieldDiary.all.paginate(page: params[:page]).order( :data )
  end

  # GET /field_diaries/1
  # GET /field_diaries/1.json
  def show
  end

  # GET /field_diaries/new
  def new
    @field_diary = FieldDiary.new
  end

  # GET /field_diaries/1/edit
  def edit
  end

  # POST /field_diaries
  # POST /field_diaries.json
  def create
    @field_diary = FieldDiary.new(field_diary_params)
    @field_diary.user_id = current_user.id
    respond_to do |format|
      if @field_diary.save
        format.html { redirect_to @field_diary, notice: 'Field diary was successfully created.' }
        format.json { render :show, status: :created, location: @field_diary }
      else
        format.html { render :new }
        format.json { render json: @field_diary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /field_diaries/1
  # PATCH/PUT /field_diaries/1.json
  def update
    respond_to do |format|
      if @field_diary.update(field_diary_params)
        format.html { redirect_to @field_diary, notice: 'Field diary was successfully updated.' }
        format.json { render :show, status: :ok, location: @field_diary }
      else
        format.html { render :edit }
        format.json { render json: @field_diary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /field_diaries/1
  # DELETE /field_diaries/1.json
  # def destroy
  #   @field_diary.destroy
  #   respond_to do |format|
  #     format.html { redirect_to field_diaries_url, notice: 'Field diary was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_field_diary
      @field_diary = FieldDiary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def field_diary_params
      params.require(:field_diary).permit(:data, :descricao)
    end
end
