module FriendsHelper
    def get_avatar(email)
        gravatar_id = Digest::MD5::hexdigest(email).downcase
        url = "https://gravatar.com/avatar/#{gravatar_id}?s=32&d=identicon&r=PG"
    end 
end
