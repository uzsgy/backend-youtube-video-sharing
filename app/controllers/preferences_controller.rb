class PreferencesController < ApplicationController
  before_action :set_preference, only: [:like, :dislike]

  def like
    if @preference.like?
      @preference.idle!
    else
      @preference.like!
    end

    render json: @preference, status: 200
  end

  def dislike
    if @preference.like?
      @preference.idle!
    else
      @preference.dislike!
    end

    render json: @preference, status: 200
  end

  private

  def set_preference
    video = Video.find(params[:video_id])
    return render json: false, status: 400 if video.user_id == current_user.id

    @preference = Preference.includes(:video).find_or_initialize_by(video_id: params[:video_id], user: current_user)
  end
end
