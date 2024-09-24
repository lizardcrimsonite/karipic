# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Crear un usuario de prueba
# Crear un usuario de prueba
user = User.find_or_create_by!(email: 'karina@example.com') do |u|
  u.password = 'password'
  u.name = 'Karina'
end

# Adjuntar una imagen de perfil al usuario
profile_image_path = Rails.root.join('app', 'assets', 'images', 'profile_user.png')
unless File.exist?(profile_image_path)
  puts "Error: El archivo #{profile_image_path} no existe."
  exit
end
user.profile_image.attach(io: File.open(profile_image_path), filename: 'profile_user.png', content_type: 'image/jpeg')

# Crear un par de imágenes de prueba y adjuntar imágenes a las Picture
picture1 = Picture.create!(name: 'Sunset', content: 'Beautiful sunset over the hills', user: user)
picture2 = Picture.create!(name: 'Mountains', content: 'Snowy mountains in winter', user: user)

# Adjuntar imágenes a las Pictures
picture1_image_path = Rails.root.join('app', 'assets', 'images', 'picture1.jpg')
unless File.exist?(picture1_image_path)
  puts "Error: El archivo #{picture1_image_path} no existe."
  exit
end
picture1.image.attach(io: File.open(picture1_image_path), filename: 'picture1.jpg', content_type: 'image/jpeg')

picture2_image_path = Rails.root.join('app', 'assets', 'images', 'picture2.png')
unless File.exist?(picture2_image_path)
  puts "Error: El archivo #{picture2_image_path} no existe."
  exit
end
picture2.image.attach(io: File.open(picture2_image_path), filename: 'picture2.png', content_type: 'image/jpeg')

# Crear comentarios de prueba
Comment.create!(content: 'Amazing picture!', user: user, picture: picture1)
Comment.create!(content: 'Looks so peaceful!', user: user, picture: picture2)


