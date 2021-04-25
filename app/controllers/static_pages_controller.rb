class StaticPagesController < ApplicationController
    require 'flickr'

    def index
        client = Flickr.new

        if params[:id]
            begin
                @photos = client.people.getPublicPhotos(user_id: params[:id])
            rescue Flickr::FailedResponse
                flash[:alert] = 'User not found'
                @photos = []
            end
        end
    end
end
