class Api::V1::CommentsController < Api::V1::BaseController
  before_action :authenticate_user, except: [:show]
  before_action :authorize_user, except: [:show]

  def show
    @post = Post.find(params[:post_id])
    comment = @post.comments.find(params[:id])
    redirect_to [comment.post.topic, comment.post]
    render json: comment, status: 200
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
