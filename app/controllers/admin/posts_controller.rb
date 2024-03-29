class Admin::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /admin/posts
  def index
    @posts = Post.all
  end

  # GET /admin/posts/1
  def show
  end

  # GET /admin/posts/new
  def new
    @post = Post.new
  end

  # GET /admin/posts/1/edit
  def edit
  end

  # POST /admin/posts
  def create
    @post = Post.new(post_params.merge(user_id: current_user.id))

    if @post.save
      redirect_to admin_post_path(@post), notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/posts/1
  def update
    if @post.update(post_params)
      redirect_to admin_post_path(@post), notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/posts/1
  def destroy
    @post.destroy
    redirect_to admin_posts_url, notice: 'Post was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def post_params
    params.require(:post).permit(:title, :subtitle, :content, :cover)
  end
end
