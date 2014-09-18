class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, foreign_key: "author_id"

  def admin?
    role == 'admin'
  end

  def self.from_omniauth auth
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = "#{user.username}-CHANGEME@twitter.example.com"
    end
  end

  def self.new_with_session params, session
    if session["devise.user_attributes"]
      new(session["deviser.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def password_required?
    super && provider.blank?
  end

  def update_with_password params, *options
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end
end

class NullUser
  def admin?
    nil
  end
end
