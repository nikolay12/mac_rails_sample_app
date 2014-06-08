namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Example User", email: "example@railstutorial.org", password: "foobar", password_confirmation: "foobar", admin: true)
    #User.create!(name: "Example user", email: "example@railstutorial.org", password: "foobar", password_confirmation: "foobar")
    99.times do |n|
      Rails.logger.debug "populate: n= "+n.to_s
      name = Faker::Name.name
      Rails.logger.debug "populate: name= "+name.to_s
      email = "example-#{n+1}@railstutorial.org"
      Rails.logger.debug "populate: email= "+email.to_s
      password = "password"
      User.create!(name: name, email: email, password: password, password_confirmation: password)
    end
    
    users = User.all(limit: 6)
    50.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.microposts.create!(content: content)}
    end
  end
end