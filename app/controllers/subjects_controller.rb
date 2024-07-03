class SubjectsController < ApplicationController
  http_basic_authenticate_with name: "Admin", password: "root"

  def create
    @user = User.find(params[:user_id])
    @subject = @user.subjects.create(subject_params)
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:user_id])
    @user = @user.subjects.find(params[:id])
    @user.destroy
    redirect_to user_path(@user), status: :see_other
  end

  private
  def subject_params
    params.require(:subject).permit(:sub_name,:sub_code,:details, :status)
  end
end
