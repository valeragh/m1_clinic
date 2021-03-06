class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.where("role = 'doctor'")
    #@users = User.where.not("id = ?",current_user.id).order("created_at DESC")
    @conversations = Conversation.involving(current_user).order('updated_at DESC').page(params[:page]).per(15)
  end

  def show
    @conversations = Conversation.involving(current_user).order("created_at DESC")
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'User was successfully created'
    else
      render action: 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to @user, notice: 'Your profile was successfully created'
    else
      render action: 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id]).destroy
    redirect_to users_url, notice: 'User deleted'
  end

  private
    def user_params
      params.require(:user).permit(:name)
    end

    def conversation_params
      params.permit(:sender_id, :recipient_id)
    end

    def interlocutor(conversation)
      current_user == conversation.recipient ? conversation.sender : conversation.recipient
    end

end
