class FriendshipsController < ApplicationController
    
    def index
        if current_user
            friendships=[]
            friendships=current_user.friendships
            render :json=>friendships.as_json()
            
            logger.debug "============>"
            logger.debug friendships
        end
    end
    def create
        if current_user
            friendships=current_user.friendships
            friendIds=[]
            friendships.map{|friend|puts friendIds.push(friend[:friend_id])}
            if friendIds.exclude?(params[:user2_id])
                newFriendship=Friendship.create(user_id: current_user.id, friend_id: params[:user2_id], friend_username: params[:friend_username])
                render :json=>newFriendship.as_json()
                friendIds.clear
            else
                render :json=>{"error": "User already in your friend list"}
            end
        end
    end
    def destroy
        # if current_user
            friendship=Friendship.find(params[:id])
            logger.debug "============>"
            logger.debug friendship
            friendship.destroy
        # end
    end
end
