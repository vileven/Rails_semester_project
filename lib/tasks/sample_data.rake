def set_default_avatar(user)
  File.open(File.join('app/assets/images/fallback/default.png')) do |f|
    user.avatar = f
  end
end

tags = %w(ML PCA LDA Math MATH statistics LearningRate
    ReinforcementLearning DeepLearning GradientDescent SVD
    SpectralDecomposition LogisticRegression NN LinearMap
    LinearRegression activation backpropagation AI StrongAI
    Reduction regularization L1 L2 Ellastic kNN qNN
    probability graphs hiddenlayers Python R NumPy Ruby TensorFlow)


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
        qs = Question.new(author: user, title: title, content: content)
        tags_for_qs = tags.shuffle[1..rand(1..4)]
        tags_for_qs.each do |el|
          if Tag.where(name: el).exists?
            tag = Tag.where(name: el)[0]
          else
            tag = Tag.new(name: el)
          end
          tag.question_count += 1
          tag.save!
          qs.tags << tag
          tag
        end
        qs.save!
        user.question_count += 1
        user.save!
        p tags_for_qs
      end
    end

    for question in Question.all.limit(20) do
      users = User.all.limit(20).to_a
      10.times do
        content = Faker::Lorem.paragraph(5)
        user = users.shuffle[0]
        question.answers.create!(content: content, answerer: user)
      end
    end
  end
end