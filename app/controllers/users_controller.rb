class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def index
    @users = User.paginate(page: params[:page], per_page: 20)
  end

  def new
    @user = User.new
  end

  def show
    @user = User.where(id: params[:id])[0]
    unless @user
      flash[:warning] = "User doesn't exist"
      redirect_to(root_path)
    else
      @questions = @user.questions.paginate(page: params[:page], per_page: 10)
    end

    # if params[:set_locale]
    #   locale = params[:set_locale].to_s.strip.to_sym
    #   I18n.locale = I18n.available_locales.include?(locale) ?
    #       locale :
    #       I18n.default_locale
    #   @locale = params[:set_locale]
    # end
  end

  def create
    @user = User.new(user_params)
    set_default_avatar(@user)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to AskMachine!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      # @user.avatar = params[:avatar]
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :avatar)
  end

  def set_default_avatar(user)
    File.open(File.join('app/assets/images/fallback/default.png')) do |f|
      user.avatar = f
    end
  end

  # Before filters

  def correct_user
    @user = User.where(id: params[:id])[0]
    unless @user
      redirect_to(root_path)
    else
      redirect_to(root_url) unless current_user?(@user)
    end

  end

  def admin_user
    redirect_to(root_url) unless current_user.present? && current_user.admin?
  end
end

