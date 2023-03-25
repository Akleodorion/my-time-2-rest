require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.destroy_all
Diploma.destroy_all
Experience.destroy_all
Offer.destroy_all

diplomas = %w[BTS Licence Master Formation Certification]

jobs_male = ['Developpeur web', 'UI/UX Designer', 'Graphiste', 'Community Manager', 'Data Scientist', 'Product Owner',
             'Product Manager', 'Développeur Fullstack', 'Développeur Frontend', 'Développeur Backend',
             'Développeur Mobile', 'Développeur Ruby', 'Développeur Rails', 'Développeur React']


jobs_female = ['Développeuse web', 'UI/UX Designer', 'Graphiste', 'Community Manager', 'Data Scientist',
               'Product Owner', 'Product Manager', 'Développeuse Fullstack', 'Développeuse Frontend',
               'Développeuse Backend', 'Développeuse Mobile', 'Développeuse Ruby', 'Développeuse Rails',
               'Développeuse React']

10.times do
  sleep(1)
  p 'Creating user'
  gender = rand(0..1)
  l_name = Faker::Name.last_name

  f_name = if gender.zero?
             Faker::Name.female_first_name
           else
             Faker::Name.male_first_name
           end

  User.create(first_name: f_name, last_name: l_name, age: rand(24..35),
              picture_url: '../app/assets/images/base_picture.png', email: "#{f_name}@gmail.com",
              password: 'lewagon', password_confirmation: 'lewagon')

  p User.last.first_name + ' ' + User.last.last_name

  job = if gender.zero?
          jobs_female.sample
        else
          jobs_male.sample
        end

  Diploma.create(title: "#{diplomas.sample} #{job}", description: Faker::Educator.university,
                 start_date: Faker::Date.between(from: 7.years.ago, to: 3.year.ago),
                 end_date: Faker::Date.between(from: 3.year.ago, to: 2.year.ago), user_id: User.last.id)

  Experience.create(title: "Expérience professionnelle en tant que #{job}", description: Faker::Company.name,
                    start_date: Faker::Date.between(from: 2.years.ago, to: 1.year.ago),
                    end_date: Faker::Date.between(from: 1.year.ago, to: Date.today), user_id: User.last.id)
  Offer.create(user_id: User.last.id, job_title: jobs_male.sample, start_date: Faker::Date.between(from: Date.today, to: Date.today + 15.days),
               end_date: Faker::Date.between(from: Date.today + 15.days, to: Date.today + 45.days),
               description: Faker::Lorem.paragraph(sentence_count: 3), status: 'pending', salary: rand(100..300))
end
