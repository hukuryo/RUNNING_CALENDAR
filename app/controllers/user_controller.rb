class UserController < ApplicationController
    
    def index
        @blogs = Blog.includes(:user)
        @total_distance = Blog.all.sum(:distance)
    end
    
    private
    
    def user_params
        params.require(:user).permit(:name)
    end
end
