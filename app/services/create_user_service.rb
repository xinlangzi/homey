class CreateUserService

  def call
    50.times do
      user = User.new
      user.name = Faker::Name.name
      user.email = Faker::Internet.email
      user.password = '123456'
      user.password_confirmation = '123456'
      user.confirm!
      user.send([:vip!, :user!].sample)
      puts "#{user.role}: #{user.name}"
    end
  end

end
