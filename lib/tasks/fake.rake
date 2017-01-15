namespace :fake do

  task :users => :environment do
    25.times do |n|
      user = User.new
      user.email = Faker::Internet.email
      user.first_name = Faker::Name.first_name
      user.last_name = Faker::Name.last_name
      user.phone = Faker::PhoneNumber.phone_number
      user.age = rand(18..90)
      user.avatar = Faker::Avatar.image
      user.password = 'password'
      user.save!
    end
  end

  task :ads => :environment do
    users = User.all

    [Ad::JOBS_CATEGORY, Ad::STAYS_CATEGORY, Ad::RIDES_CATEGORY].each do |category|
      50.times do |n|
        ad = Ad.new
        ad.category = category

        case category
        when Ad::JOBS_CATEGORY
          ad.title = Faker::Hipster.sentence
        when Ad::STAYS_CATEGORY
          ad.title = Faker::LordOfTheRings.location
        when Ad::RIDES_CATEGORY
          ad.title = Faker::Space.distance_measurement
        end

        ad.description = Faker::Lorem.sentences(3)
        ad.user = users.sample
        ad.start_date = Faker::Date.backward(30)
        ad.end_date = Faker::Date.between(ad.start_date, Date.today)
        ad.save!
        ad.created_at = Faker::Date.between(Date.today - 60, ad.start_date)
        ad.save!
      end
    end
  end

end
