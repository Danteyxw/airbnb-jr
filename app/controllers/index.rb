get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/signup' do
  email = params[:email]
  password = params[:password]
  user = User.new(email: email, password: password)

  if user.valid?
    user.save
  else

  end
end

post '/login' do

end