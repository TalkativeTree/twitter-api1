helpers do
  
  def current_user
    @user ||= User.find(session[:id]) if session[:id]
  end
  
  def tweets_stale?
    if @user.tweets.empty? || (Time.now - @user.last_updated  > 900000)
      get_tweets
    end
  end

  def get_tweets
    @tweets = Twitter.user_timeline(params[:username], options = {:count => 10}) 
    @tweets.each do |save|
      p @user
      @user.tweets << Tweet.create(text: save.text, time: save.created_at, url: save.id, user_id: @user.id)
    end
  end

  def create_user
    attr = Twitter.user(params[:username]) 
    @user = User.create(
      username: attr.username, 
      name: attr.name, 
      photo_url: attr.profile_image_url,
      last_updated: Time.now
      )
  end
end
