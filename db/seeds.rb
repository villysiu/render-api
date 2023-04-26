# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# require 'open-uri'
User.destroy_all
Photo.destroy_all
# u=User.create!(email:"mickey@disney.com", name:"mickey", password:'password')
3.times do |index|
    user=User.create!(

        name: Faker::Name.first_name,
        email: Faker::Internet.unique.email,
        password: Faker::Internet.password(min_length: 8, max_length: 12),
        bio: Faker::Quote.matz,
        # avatar_link: Faker::Avatar.image
    )
    downloaded_file = URI.open(Faker::Avatar.image)

    user.avatar.attach(io: downloaded_file, filename: "avatar_#{index}.png")
    user.save
end
2.times do |index|
    n=rand(1..User.count)
    user=User.find(n)
    puts n
    puts user
    photo=user.photos.new()
    photo.desc = Faker::TvShows::HowIMetYourMother.quote

    openAIClient = OpenAI::Client.new
    
    response = openAIClient.images.generate(
        parameters: { 
            prompt: photo.desc, 
            # prompt: "whale in a hat and pink gloves",
            size: "512x512" 
        })
    puts response
    image_url=response.dig("data", 0, "url")
    downloaded_file = URI.open(image_url)

    photo.url.attach(io: downloaded_file, filename: "openai_image_#{index}.png")
    puts photo.url
    photo.save!
    puts "is photo saved?"
    puts photo
    
   

end
puts "#{User.count} users created"
puts "#{Photo.count} photos created"
# p=Photo.create!(desc: 'something', url: 'a link', user_id: u.id)
# Comment.create!(comment: "love", user_id: u.id, photo_id: p.id)