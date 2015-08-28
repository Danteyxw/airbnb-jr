get '/' do
  # Look in app/views/index.erb
    @user = User.find(session[:user]) unless session[:user].nil?

    @properties = Property.all.reverse
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
    "Please login to submit your properties"
  end
end

get '/property/search' do
  tags = params[:tags]
  unless tags.nil? || tags.size == 0
    tags = tags.split(",").map { |tag| tag.strip.downcase }
    @properties = []

    tags.each do |tag|
      @tag = Tag.find_by(name: tag)
      @tag.properties.each do |property|
        @properties << property
      end
    end

    @properties.uniq.reverse
  else
    @properties = Property.all.reverse
  end

  erb :index
end

get '/property/own' do
  unless session[:user].nil?
    user = User.find(session[:user])
    @properties = user.properties
    erb :index
  else
    "Please login to search your properties"
  end
end

post '/property/book' do
  unless session[:user].nil?
    user = User.find(session[:user])

    a_start_date = params[:start_date]
    a_end_date = params[:end_date]
    property_id = params[:property_id]

    booking = user.bookings.new(start_date: a_start_date, end_date: a_end_date, property_id: property_id)

    a_start_date = Date.parse(a_start_date)
    a_end_date = Date.parse(a_end_date)

    property = Property.find(property_id)

    if a_end_date > a_start_date && a_start_date > Date.today
      bookings = property.bookings
      unless bookings.nil?
        bookings.each do |booking|
          b_start_date = Date.parse(booking.start_date)
          b_end_date = Date.parse(booking.start_date)
          return "The duration of your booking clashes with others" unless a_end_date < b_start_date || a_start_date > b_end_date
        end
      end
      booking.save
    else
      "Sorry, we do not do time travel services (check your dates)"
    end
  else
    "Please login to book a property"
  end
end