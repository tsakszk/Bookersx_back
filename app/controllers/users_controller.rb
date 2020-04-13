class UsersController < ApplicationController
    before_action :authenticate_user!
    def index
        @book = Book.new
        @user = User.find(current_user.id)
        @users = User.all
    end
    def show
        @book = Book.new
        @user = User.find(params[:id])
        @newbook = @user.books
    end
    def edit
        @user = User.find(params[:id])
        if current_user != @user
           redirect_to user_path(current_user.id)
        end
    end
    def update
        @user = User.find(params[:id])
        if
         @user.update(user_params)
         redirect_to user_path(@user.id),notice: 'You have creatad book successfully.'
        else
         render :edit
        end
    end
    private
    def book_params
      params.require(:book).permit(:title, :body)
    end
    def user_params
      params.require(:user).permit(:name, :introduction, :profile_image)
    end
end