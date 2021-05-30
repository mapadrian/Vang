class PicturesController < ApplicationController
  before_action :set_picture, only: %i[ show edit update destroy like unlike]
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :like, :unlike]
  impressionist actions:[:show], unique: [:impressionable_type, :impressionable_id, :session_hash]
  # GET /pictures or /pictures.json
  def index
    @pictures = Picture.all.order('created_at DESC')
  end

  # GET /pictures/1 or /pictures/1.json
  def show
  end

  # GET /pictures/new
  def new
    @picture = current_user.pictures.build
  end

  # GET /pictures/1/edit
  def edit
  end

  # POST /pictures or /pictures.json
  def create
    @picture = current_user.pictures.build(picture_params)

    respond_to do |format|
      if @picture.save
        format.html { redirect_to @picture, notice: "Picture was successfully created." }
        format.json { render :show, status: :created, location: @picture }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pictures/1 or /pictures/1.json
  def update
    respond_to do |format|
      if @picture.update(picture_params)
        format.html { redirect_to @picture, notice: "Picture was successfully updated." }
        format.json { render :show, status: :ok, location: @picture }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1 or /pictures/1.json
  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to pictures_url, notice: "Picture was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  def like
    @picture.liked_by current_user
     respond_to do |format|
       format.html { redirect_back fallback_location: root_path}
       format.js {render layout: false}
     end
   end
   def unlike
     @picture.unliked_by current_user
     respond_to do |format|
       format.html { redirect_back fallback_location: root_path}
       format.js {render layout: false}
     end
   end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def picture_params
      params.require(:picture).permit(:title, :description, :user_picture)
    end
end
