class ArtworkSharesController < ApplicationController
    def create
      artwork_share = ArtworkShare.new(artwork_shares_params)
      if artwork_share.save
        render json: artwork_share
      else
        render json: artwork_share.errors.full_messages, status: 422
      end
    end

    def destroy
      artwork_share = ArtworkShare.find(params[:id])
      artwork_share.destroy
      render json: "succesfully destroyed artwork_share!"
    end

    def update
      artwork_share = ArtworkShare.find(params[:id])
      if artwork_share.update(artwork_shares_params)
        render json: artwork_share
      else
        render json: artwork_share.errors, status: 422
      end
    end

  protected

    def artwork_shares_params
      params.require(:artwork_share).permit(:artwork_id, :viewer_id)
    end
end