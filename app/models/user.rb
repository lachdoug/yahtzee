class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable
    # , :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :workshop_key

  has_many :games
  has_one :user_metrics
  has_many :apps

  def user_metrics
    super || build_user_metrics
  end

  validates :username, length: {minimum: 5, maximum: 12}, uniqueness: true
  validates :password, length: {minimum: 6}, confirmation: true, on: :create
  validate :workshop_key_is_correct

  # Assign an API token on create
  before_create do |user|
    user.api_token = user.generate_api_token
  end

  # Generate a unique API token
  def generate_api_token
    loop do
      token = SecureRandom.base64.tr('+/=', 'Qrt')
      break token unless User.exists?(api_token: token)
    end
  end

  def workshop_key_is_correct
    errors.add :workshop_key, 'is incorrect' unless username == 'admin' || Rails.application.config.workshop_key == self.workshop_key
  end

  def is_admin?
    username == 'admin'
  end

  # def update_metrics
  #   user_metrics.update
  #   # byebug
  # end

  def self.ranked_users
    all.reject(&:is_admin?).
      sort_by(&:username).
      sort_by{ |u| ( u.user_metrics.average_score || 0 ) }.
      reverse
  end

end
