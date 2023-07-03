module Videos
  class VideosController < ApplicationController
    before_action :set_video, only: [:show, :destroy]

    def index
      search = Video.ransack(params[:query])
      search.sorts = "updated desc" if search.sorts.empty?
      videos = search.result.includes(:user).page(params[:page]).per(Video::PER)
      render json: {
        videos: videos,
        total: videos.total_pages,
      }, status: 200
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

    def show
      render json: @video, status: 200
    end

    def destroy
      return render json: @video, status: 200 if @video.destroy
      render false
    end

    private

    def set_video
      @video = Video.find(params[:id])
    end
  end
end
