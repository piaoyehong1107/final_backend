class FriendshipsController < ApplicationController
    def index
        if current_user
            @friendships=current_user.friendships
            friends=[]
            @friendships.map{|friendship|friends.push(User.find_by(id: friendship.friend_id))}
            render :json=>friends.as_json(only: [:id, :username])
        end
    end
    def create
        if current_user
            @friendship=Friendship.create(user_id: current_user.id, friend_id: params[:user2_id])
            render :json=>@friendship.as_json()
        end
    end
end
