post '/sign_up' do 
  @user = User.new(params)
  if @user.save?
    session[:user_id] = @user.id
  else
    @errors = @user.errors.full_messages.join(", ")
    erb :log_sign
  end
end


post '/log_in' do
  @user = User.find_by_username(params[:email])
  if @user
    if @user.password == params[:password]
      session[:id] = @user.id
    else
      erb :log_sign
    end
  end
end

get '/log_out' do
  session.clear
  redirect '/'
end

get '/log_sign' do
  erb :log_sign
end
