module Videos
  class CreateForm
    include ActiveModel::Model

    def persisted?
      false
    end

    def self.model_name
      ActiveModel::Name(self, nil, "Video")
    end

    validates_format_of :url, with: /\A(?:https?:\/\/)?(?:www\.)?youtube\.com\/watch\?(?=.*v=((\w|-){11}))(?:\S+)?\z/

    delegate :user_id, :url, :embed_url, :title, :description, to: :video

    def initialize(user, params)
      @params = params
      @video = Video.new video_params.merge(user: user)
    end

    def video
      @video ||= Video.new
    end

    def save
      return false unless valid?
      video.save!

      true
    end

    private

    def video_params
      @params.permit(:url)
    end
  end
end
