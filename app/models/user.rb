class User < ApplicationRecord
  has_many :reviews
  has_many :commments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         
 has_one_attached :profile_image
 
 def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
 end
 
 def self.looks(search, word)
    if search == "perfect_match"
      @user = User.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @user = User.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @user = User.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @user = User.where("name LIKE?","%#{word}%")
    else
      @user = User.all
    end
 end
 
# def get_profile_image(width, height)
#   unless profile_image.attached?
#     file_path = Rails.root.join('app/assets/images/no_image.jpg')
#     profile_image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
#   end
#   profile_image.variant(resize_to_limit: [width, height]).processed
# end

end
