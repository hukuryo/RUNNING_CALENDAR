class UserController < ApplicationController
    
    def index
        @blogs = Blog.includes(:user）
    end
    
    private
    
    def user_params
        params.require(:user).permit(:name)
    end
end
