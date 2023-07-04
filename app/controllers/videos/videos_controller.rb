module Videos
  class VideosController < ApplicationController
    before_action :set_video, only: [:show, :destroy]

    def index
      search = Video.ransack(params[:query])
      search.sorts = "updated desc" if search.sorts.empty?
      videos = search.result.includes(:user, :preferences).page(params[:page]).per(Video::PER)

      render json: {
        videos: build_result(videos),
        total: videos.total_pages,
      }, status: 200
    end

    def show
      render json: build_result([@video])[0], status: 200
    end

    def create
      render json: false unless current_user

      form = CreateForm.new current_user, params
      if form.save
        render json: form.video, status: 200
      else
        render json: false, status: 500
      end
    end

    def destroy
      return render json: @video, status: 200 if @video.destroy
      render false
    end

    private

    def build_result(videos)
      videos.map do |v|
        preference = v.preferences.by_user(1)
        v.attributes.merge(
          user: v.user,
          like: v.preferences.like.count,
          dislike: v.preferences.dislike.count,
          preference: preference,
        )
      end
    end

    def set_video
      @video = Video.find(params[:id])
    end
  end
end
