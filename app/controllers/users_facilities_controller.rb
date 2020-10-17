class UsersFacilitiesController < ApplicationController
  before_action :set_users_facility, only: [:show, :edit, :update, :destroy]

  # GET /users_facilities
  # GET /users_facilities.json
  def index
    @users_facilities = UsersFacility.all
  end

  # GET /users_facilities/1
  # GET /users_facilities/1.json
  def show
  end

  # GET /users_facilities/new
  def new
    @users_facility = UsersFacility.new
  end

  # GET /users_facilities/1/edit
  def edit
  end

  # POST /users_facilities
  # POST /users_facilities.json
  def create
    @users_facility = UsersFacility.new(users_facility_params)

    respond_to do |format|
      if @users_facility.save
        format.html { redirect_to @users_facility, notice: 'Users facility was successfully created.' }
        format.json { render :show, status: :created, location: @users_facility }
      else
        format.html { render :new }
        format.json { render json: @users_facility.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users_facilities/1
  # PATCH/PUT /users_facilities/1.json
  def update
    respond_to do |format|
      if @users_facility.update(users_facility_params)
        format.html { redirect_to @users_facility, notice: 'Users facility was successfully updated.' }
        format.json { render :show, status: :ok, location: @users_facility }
      else
        format.html { render :edit }
        format.json { render json: @users_facility.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users_facilities/1
  # DELETE /users_facilities/1.json
  def destroy
    @users_facility.destroy
    respond_to do |format|
      format.html { redirect_to users_facilities_url, notice: 'Users facility was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users_facility
      @users_facility = UsersFacility.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def users_facility_params
      params.require(:users_facility).permit(:user_id, :facility_id)
    end
end
