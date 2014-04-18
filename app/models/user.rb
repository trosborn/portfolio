class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, foreign_key: "author_id"

  def author?
    role == 'author'
  end

  def editor?
    role == 'editor'
  end
end

class NullUser
  def author?
    nil
  end

  def editor?
    nil
  end
end
