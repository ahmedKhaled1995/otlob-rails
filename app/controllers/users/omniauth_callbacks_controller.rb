#class Users::OmniauthCallbacksController < ApplicationController
#end

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    # def facebook
    #   @user = User.from_omniauth(request.env["omniauth.auth"])
    #   sign_in_and_redirect @user
    # end

    def facebook
      @user = User.connect_to_facebook(request.env["omniauth.auth"], current_user)
      if @user.persisted?
        sign_in_and_redirect @user, :event => :authentication
        set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
      else
        session["devise.facebook_data"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
    end

   
    # def linkedin
    #   @user = User.from_omniauth(request.env["omniauth.auth"])
    #   sign_in_and_redirect @user
    # end

    def linkedin
      @user = User.connect_to_linkedin(request.env["omniauth.auth"],current_user)
      if @user.persisted?
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success"
        sign_in_and_redirect @user, :event => :authentication
      else
        session["devise.linkedin_uid"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
    end

    def google_oauth2
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      @user = User.connect_to_gmail(request.env["omniauth.auth"], current_user)
      if @user.persisted?
        sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
        set_flash_message(:notice, :success, kind: "Google") if is_navigational_format?
      else
        session["devise.google_oauth2_data"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
    end

    def failure
      redirect_to root_path
    end
    
end
