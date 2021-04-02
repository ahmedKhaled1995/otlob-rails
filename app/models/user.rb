class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
   :registerable, :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :linkedin]


  #  def self.new_with_session(params, session)
  #   super.tap do |user|
  #     if data = session["devise.linkedin_data"] && session["devise.linkedin_data"]["extra"]["raw_info"]
  #       user.email = data["email"] if user.email.blank?
  #     end
  #   end
  # end

  # def self.new_with_session(params, session)
  #   super.tap do |user|
  #   if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
  #   user.email = data["email"] if user.email.blank?
  #   end
  #   end
  #   end
    
  # def self.connect_to_facebook(auth)
  #   puts "------>>>>>" 
  #   puts auth.info
  #   puts "------<<<<<" 
  #   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #   user.email = auth.info.email
  #   user.password = Devise.friendly_token[0,20]
  #   user.full_name = auth.info.name # assuming the user model has a name
  #   user.image = auth.info.image # assuming the user model has an image
  #   end
  # end

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
  
  # def self.from_omniauth(auth)
  #   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #     user.email = auth.info.email
  #     user.provider = auth.provider
  #     user.uid = auth.uid
  #     user.password = Devise.friendly_token[0,20]
  #   end
  # end

end
