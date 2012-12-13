class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  attr_accessible :email, :remember_me, :full_name, :birth_date, :provider, :uid, :password
  validates_presence_of :full_name
  has_many :lists, dependent: :destroy
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    #puts "*"*100
    #p auth
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(full_name:auth.extra.raw_info.name,
                           provider:auth.provider,
                           uid:auth.uid,
                           email:auth.info.email,
                           password:Devise.friendly_token[0,20],
                           birth_date:(auth.extra.raw_info.birthday).to_s
                          )
    end
    user

  end
  
end
