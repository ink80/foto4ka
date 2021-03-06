class ProfileController < ApplicationController
  before_action :authenticate_user!

  def show
    id = params[:id]

    @user = User.find(id)

    @following_count = @user.follow_count
    @follower_count = @user.followers_count

    @profile = User.select(:name, :bio, 'profiles.id').joins(:profile).find_by('users.id' => id)

    @following_posts = Post.includes(:user).where('user_id' => @user.all_following)

    @all_posts = Post.joins(:user).select(:id, :title, :body, :image, :image_file_name, :created_at, :updated_at,
                                          :user_id).where('users.id' => id).order('posts.updated_at').reverse_order
  end

  def update
    @pf = Profile.find_by(user_id: current_user.id)
    @pf.update(name: pf_params[:name], bio: pf_params[:bio])
    redirect_to view_profile_path(current_user.id)
  end

  def edit
    @profile = Profile.find_by(user_id: current_user.id)
  end

  protected

  def pf_params
    params.require(:profile).permit(:name, :bio)
  end
end
