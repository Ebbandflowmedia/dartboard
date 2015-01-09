class User < ActiveRecord::Base
  

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable :confirmable, :validatable
 devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  #has_many :listings
  has_and_belongs_to_many :roles
  has_many :accounts

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
         
  #validates :fname, presence: true

  #validates :lname, presence: true

 # validates :user_name, presence: true, 
 #						  uniqueness: true,
 #						  format: {
 #						  	with: /\A[a-zA-Z0-9\-\_]+\Z/,
 #						  	message: 'Must be formated correctly.'
 #						  }

 def role?(role)
      return !!self.roles.find_by_name(role)
 end

 def fullName
    fname + ' ' + lname
 end


end
