class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :user_projects
  has_many :projects, through: :user_projects

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
 # attr_accessor :login
   #case insensitivity for the username and uniquness
   validates :username,
  :presence => true,
  :uniqueness => {
    :case_sensitive => false
  }
  def self.search(query)
    where("username like ?", "%#{query}")
  end
   has_many :posts
   has_many :comments

end
