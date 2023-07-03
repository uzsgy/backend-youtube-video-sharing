class RegistrationForm
  include ActiveModel::Model

  def persisted?
    false
  end

  def self.model_name
    ActiveModel::Name(self, nil, "User")
  end

  validate :verify_unique_username
  validate :verify_unique_email
  validates_presence_of :username, :email, :password
  validates_format_of :email, with: /\A(([^<>()\[\]\\.,;:\s@\"]+(\.[^<>()\[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))\z/
  validates_length_of :password, minimum: 8

  delegate :username, :email, :password, :errors, to: :user

  def initialize(params)
    @params = params
    @user = User.new user_params
  end

  def user
    @user ||= User.new
  end

  def save
    return false unless valid?
    user.save!

    true
  end

  private

  def user_params
    @params.require(:user).permit(:email, :username, :password).merge(role: 2)
  end

  def verify_unique_username
    if User.exists? username: username
      errors.add :username, "has already been taken"
    end
  end

  def verify_unique_email
    if User.exists? email: email
      errors.add :email, "has already been taken"
    end
  end
end
