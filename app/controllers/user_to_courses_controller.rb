class UserToCoursesController < ApplicationController
    def create
      @relationship = ArtistRelationship.new
      @relationship.fan_id = current_fan.id
      @relationship.artist_id = Artist.friendly.find(params[:artist_id]).id
      if @relationship.save
          respond_to do |format|
          format.html { redirect_to(:back) }
          format.js {render :action => "follow_button" }
        end
      else
        redirect_to root_url
      end
    end
    
    def destroy
      current_fan.unfollow_artist(Artist.friendly.find(params[:id]))
      respond_to do |format|
        format.html { redirect_to(:back) }
        format.js {render :action => "follow_button" }
      end
    end
end
