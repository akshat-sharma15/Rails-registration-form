class UsersController < ApplicationController
  http_basic_authenticate_with name: "Admin", password: "root", except: [:index, :show]

  def index
    @user = User.all
  end

  def show 
    @user = User.find(params[:id])
  end

  def new 
    @user = User.new
  end

  def create 
    @user = User.new(user_params)
    if @user.save
        redirect_to @user
    else
        render :new, status: :unprocessable_entity

    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to root_path, status: :see_other
  end

  def edit
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :mobile, :college, :gender, :dob, :cousre, :status)
  end

end
