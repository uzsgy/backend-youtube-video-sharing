module Videos
  class CreateForm
    include ActiveModel::Model

    def persisted?
      false
    end

    def self.model_name
      ActiveModel::Name(self, nil, "Video")
    end

    delegate :user_id, :code, :title, :description, :thumbnails, to: :video
    validates_presence_of :code, :title, :description, :thumbnails

    def initialize(user, params)
      @params = params
      @video = YoutubeApi.new(params[:url]).get_video
      @video.user = user if @video.present?
    end

    def video
      @video ||= Video.new
    end

    def save
      return false unless valid? && @video

      video.save!
      true
    end
  end
end
