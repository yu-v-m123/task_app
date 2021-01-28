class PostsController < ApplicationController
  def index
    @posts = Post.all.order("finish ASC")
  end
  
  def new
    @post = Post.new
    render layout: "no_count"
  end
  
  def create
    @post = Post.new(params.require(:post).permit(:title, :start, :finish, :check, :memo))
    if @post.save
      flash[:notice] = "スケジュールを登録しました"
      redirect_to :posts
    else
      flash[:alert] = "スケジュールを登録できませんでした"
      render "new"
    end
  end
  
  def show
    @post = Post.find(params[:id])
    render layout: "no_count"
  end
  
  def edit
    @post = Post.find(params[:id])
    render layout: "no_count"
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(params.require(:post).permit(:title, :start, :finish, :check, :memo))
      flash[:notice] = "スケジュールを更新しました"
      redirect_to :posts
    else
      flash[:alert] = "スケジュールを更新できませんでした"
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:alert] = "スケジュールを削除しました"
    redirect_to :posts
  end
end
