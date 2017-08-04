class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #t.database_authenticatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :user_to_courses, :dependent => :destroy
  
  has_attached_file :avatar, styles: { large: "600x600>" , medium: "80x80>", thumb: "40x40>" }, default_url: "avatar.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  
  def follow(course_id)
    self.user_to_courses.create(course_id: course_id)
  end
  
  def unfollow(course_id)
    self.user_to_courses.find_by_course_id(course_id).destroy if following?(course_id)
  end
  
  def following?(course_id)
    self.user_to_courses.find_by_course_id(course_id)
  end
  
end
