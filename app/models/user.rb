class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |user|
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def self.from_omniauth(auth)
      name_split = auth.info.name.split(" ")
      user       = User.where(email: auth.info.email).first
      user ||= User.create!(email: auth.info.email,
                            password: Devise.friendly_token[0, 20])
      user
  end

  has_many :clients, dependent: :destroy
  has_many :meetings, dependent: :destroy
end
