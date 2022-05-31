class UserController < ApplicationController
    
    def index
        @blogs = current_user.blogs
        @total_distance = @blogs.all.sum(:distance)
    end
    
    def show
        @user = User.find(params[:id])
        @blog = Blog.new
        @blogs = current_user.blogs
    end
    
    private
    
    def user_params
        params.require(:user).permit(:name)
    end
end
