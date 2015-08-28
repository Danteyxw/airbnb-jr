get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/user/signup' do
  email = params[:email]
  password = params[:password]
  user = User.new(email: email, password: password)

  if user.valid?
    user.save
    "Signup successful"
  else
    "There exists an account with this email"
  end
end

post '/user/login' do
  email = params[:email]
  password = params[:password]
  user = User.find_by(email: email)

  unless user.nil?
    if user.password == password
      session[:user] = user.id
      "Login successful"
    else
      "Incorrect password"
    end
  else
    "User does not exist"
  end
end

post '/property/create' do
  unless session[:user].nil?
    user = User.find(session[:user])

    name = params[:name]
    rate = params[:rate]
    capacity = params[:capacity]
    address = params[:address]
    tags = params[:tags]

    tags = tags.split(",").map { |tag| tag.strip.downcase }

    property = user.properties.new(name: name, rate: rate, capacity: capacity, address: address)

    if property.valid?
      property.save
      tags.each do |tag|
        @tag = Tag.find_or_create_by(name: tag)
        @tag.properties << property
      end
      "Submission successful"
    else
      "Invalid Submission, please retry"
    end
  else
    "Please login to list your properties"
  end
end