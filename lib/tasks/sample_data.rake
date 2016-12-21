def set_default_avatar(user)
  File.open(File.join('app/assets/images/fallback/default.png')) do |f|
    user.avatar = f
  end
end

namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    user = User.create(name: "Sergey",
                 email: "vileven11@icloud.com",
                 password: "Chelsea11",
                 password_confirmation: "Chelsea11",
                 admin: true)

    set_default_avatar(user)
    user.save!

    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@mail.com"
      password  = "password"
      user = User.create(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
      set_default_avatar(user)
      user.save!
    end


    for user in  User.all.limit(6) do
      50.times do
        title = Faker::Lorem.sentence(5)
        content = Faker::Lorem.paragraph(5)
        user.questions.create!(title: title, content: content)
      end

    end

  end
end