class User < ApplicationRecord

  has_many :friends
  has_many :groups
  has_many :orders
  has_many :items
 
  has_many :sender_notification, class_name: 'Notification',
    foreign_key: 'sender_id'
  has_many :receiver_notification, class_name: 'Notification',
    foreign_key: 'receiver_id'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
   :registerable, :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :linkedin, :google_oauth2]


  def get_image
    if image
      return image
    end
    gravatar_id = Digest::MD5::hexdigest(email).downcase
    url = "https://gravatar.com/avatar/#{gravatar_id}?s=32&d=identicon&r=PG"
  end 

  def self.connect_to_facebook(auth, signed_in_resource=nil)
    puts "------>>>>>" 
    puts auth.info
    puts "------<<<<<" 
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      return user
    else
      registered_user = User.where(:email => auth.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create(
          full_name:auth.info.name,
          provider:auth.provider, uid:auth.uid, email:auth.info.email,
          image:auth.info.image, password:Devise.friendly_token[0,20],
        )
      end
    end
  end  

  def self.connect_to_linkedin(auth, signed_in_resource=nil)
    puts "------>>>>>" 
    puts auth.info
    puts "------<<<<<" 
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      return user
    else
      registered_user = User.where(:email => auth.info.email).first
      if registered_user
        return registered_user
      else
        user_full_name = auth.info.first_name + " " + auth.info.last_name 
        user = User.create(
          full_name:user_full_name,
          provider:auth.provider, uid:auth.uid, email:auth.info.email,
          image:auth.info.picture_url, password:Devise.friendly_token[0,20],
        )
      end
    end
  end  
  
  def self.connect_to_gmail(auth, signed_in_resource=nil)
    puts "------>>>>>" 
    puts auth.info
    puts "------<<<<<" 
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      return user
    else
      registered_user = User.where(:email => auth.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create(
          full_name:auth.info.name,
          provider:auth.provider, uid:auth.uid, email:auth.info.email,
          image:auth.info.image, password:Devise.friendly_token[0,20],
        )
      end
    end
  end

end
