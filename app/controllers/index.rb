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
    "signup successful"
  else
    "There exists an account with this email"
  end
end

post '/login' do
  email = params[:email]
  password = params[:password]
  user = User.find_by(email: email)

  unless user.nil?
    if user.password == password
      session[:user] = user.id
    else
      "Incorrect password"
    end
  else
    "User does not exist"
  end
end