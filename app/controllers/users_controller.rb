class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  def new2
    @user = User.new
    old_user = User.find(params[:user_id])
    @user.first_name = old_user.first_name
    @user.last_name = old_user.last_name
    @user.email = old_user.email
    @user.dob = old_user.dob
    @user.gender = old_user.email
    @user.role_id = old_user.role_id
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save && params[:save_copy].present?
        params[:user_facilites].each do |user_facility|
          UsersFacility.create(user_id: @user.id, facility_id: user_facility)
        end
        format.html { redirect_to new2_user_path(@user), notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      elsif @user.save
        params[:user_facilites].each do |user_facility|
          UsersFacility.create(user_id: @user.id, facility_id: user_facility)
        end
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
        
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        @user.user_facilites.destroy_all if @user.user_facilites
        params[:user_facilites].each do |user_facility|
          UsersFacility.create(user_id: @user.id, facility_id: user_facility)
        end
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :dob, :gender, :role_id)
    end
end
