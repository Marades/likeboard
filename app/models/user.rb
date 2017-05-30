class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :posts
  has_many :likes
  has_many :liked_posts, through: :likes, source: :post
  
  def is_like?(p)   #좋아요를 눌렀는지 물어보는 함수
    Like.find_by(user_id: self.id, #self : 이 함수를 실행시킨 것 자체
                 post_id: p.id).present? #present : 존해하는지 안하는지 물어보는 것
  end
end
