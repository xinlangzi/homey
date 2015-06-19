class Backend::UsersController < Backend::BaseController
  def index
    @q = User.search(params[:q])
    @users = @q.result.order('name asc').page(params[:page])
    authorize User
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def new
    @user = User.new
    authorize @user
  end
  
  def create
    @user = User.new(secure_params)
    authorize @user

    respond_to do |format|
      if @user.save
        format.html { redirect_to [:backend, @user], notice: 'User was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update_attributes(secure_params)
      redirect_to backend_users_path, :notice => "User updated."
    else
      redirect_to backend_users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
    authorize user
    user.destroy
    redirect_to backend_users_path, :notice => "User deleted."
  end

  private

  def secure_params
    params.require(:user).permit(:name, :role, :email, :password, :password_confirmation)
  end

end
