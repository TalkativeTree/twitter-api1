get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/' do
  username = (params[:username])
  redirect "/#{username}"
end

get '/:username' do
  p params[:username]
  @user = User.find_by_username(params[:username])
  if @user
    tweets_stale?
  else
    create_user
    get_tweets
  end
 erb :view_user_tweets
end


  
