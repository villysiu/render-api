
User.destroy_all
Photo.destroy_all

u=User.create!(email:"mickey@disney.com", name:"mickey", password:'password')
# arr=[]
# 3.times do |index|
#     user=User.create!(

#         name: Faker::Name.first_name,
#         email: Faker::Internet.unique.email,
#         password: Faker::Internet.password(min_length: 8, max_length: 12),
#         bio: Faker::Quote.matz,
#     )
#     downloaded_file = URI.open(Faker::Avatar.image)

#     user.avatar.attach(io: downloaded_file, filename: "avatar_#{index}.png")
#     user.save

#     arr << user.id
# end

# 10.times do |index|
#     n=arr.sample
#     user=User.find(n)
    
#     photo=user.photos.new()
#     photo.desc = Faker::TvShows::HowIMetYourMother.quote

#     openAIClient = OpenAI::Client.new
    
#     response = openAIClient.images.generate(
#         parameters: { 
#             prompt: photo.desc, 
#             size: "512x512" 
#         })
    
#     image_url=response.dig("data", 0, "url")
#     downloaded_file = URI.open(image_url)

#     photo.url.attach(io: downloaded_file, filename: "openai_image_#{index}.png")
#     photo.save!
   
# end
# puts "#{User.count} users created"
# puts "#{Photo.count} photos created"
