class RelationshipsController < ApplicationController

  
  # POST /relationships
  # POST /relationships.json
  def create
    user_id = current_user_id
    other_user = User.find_by_id(params[:user_id])
    other_user_id = other_user.id
    @relationship = Relationship.new(follower_id: user_id, followed_id: other_user_id)

    respond_to do |format|
      if @relationship.save
        format.html { redirect_to home_url, notice: "Successfully followed #{other_user.name}." }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  
  # DELETE /relationships/1
  # DELETE /relationships/1.json
  def destroy
    other_user = User.find_by_id(params[:user_id])
    current_user.unfollow! other_user
    respond_to do |format|
      format.html { redirect_to home_url, notice: "Successfully unfollowed #{other_user.name}." }
    format.json { render action: 'show', status: :created, location: @user }
    end
  end

  
end
