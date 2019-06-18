class CommentsController < ApplicationController
  #  ar = (user.shared_artworks + user.artworks)
  def index

    case 
    when params[:user_id]
      user = User.find(params[:user_id])
      users_comments = user.comments
      render json: users_comments
    when params[:artwork_id]
      artwork = Artwork.find(params[:artwork_id])
      artworks_comments = artwork.comments
      render json: artworks_comments
    end
      
  end

    def create
      comment = Comment.new(comment_params)
      if comment.save
        render json: comment
      else
        render json: comment.errors.full_messages, status: 422
      end
    end

    def destroy
      comment = Comment.find(params[:id])
      comment.destroy
      render json: "succesfully destroyed comment!"
    end


  protected

    def comment_params
      params.require(:comment).permit(:body, :user_id, :artwork_id)
    end
end