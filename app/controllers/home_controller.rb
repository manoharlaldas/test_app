class HomeController < ApplicationController
  def index
    if current_user_id
    @current_user = current_user
    @post = @current_user.post.build
      @posts = @current_user.post.paginate(page: params[:page])
    else
      @posts = Post.all.paginate(page: params[:page])
    end
  end
end