class PostsController < ApplicationController
  before_action :load_post, only: :show

  def show; end

  private

  def load_post
    @post = Post.find_by(id: params[:id])
  end
end
