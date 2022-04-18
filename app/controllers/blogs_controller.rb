class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
    @blog = Blog.new
    @total_distance = Blog.all.sum(:distance)
  end
  
  def new
    @blog = Blog.new
  end

  def show
    @blog = Blog.find(params[:id])
  end
  
  def edit
    @blog = Blog.find(params[:id])
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    @blog.save!
    redirect_to blogs_path, notice:"予定を追加しました！"
  end

  def destroy
    @blog = Blog.find(params[:id])
    if @blog.destroy
      redirect_to blogs_path, alert:"削除しました"
    else
      render 'index'
    end
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "予定を変更しました!"
    else
      render 'edit'
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :distance, :content, :start_time, :user_id)
  end
end
