class RelationshipsController < ApplicationController
	def create
    other_saint = Saint.find(params[:followed_id])
    current_saint = Saint.find(params[:current_saint_id])
    current_saint.follow(other_saint)
    redirect_to other_saint
  end

  def destroy
    saint = Relationship.find(params[:id]).followed
    # current_user.unfollow(saint)
    redirect_to saint
  end
end
