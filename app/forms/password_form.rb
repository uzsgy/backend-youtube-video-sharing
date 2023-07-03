class PasswordForm
  include ActiveModel::Model

  def persisted?
    false
  end

  attr_accessor :original_password, :new_password

  validate :verify_original_password
  validates_presence_of :original_password, :new_password
  validates_length_of :new_password, minimum: 8

  def initialize(user, params)
    @user = user
    self.original_password = params[:original_password]
    self.new_password = params[:new_password]
  end

  def save
    return false unless valid?

    @user.password = new_password
    @user.save!
  end

  private

  def verify_original_password
    unless @user.authenticate(original_password)
      errors.add :original_password, "is not correct"
    end
  end
end
