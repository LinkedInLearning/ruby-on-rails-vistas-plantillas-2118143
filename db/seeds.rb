# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Crear tostadores (Roasters)
roaster1 = Roaster.create!(name: "Café del Sol", location: "Bogotá, Colombia", bio: "Tostador artesanal con granos de origen único.")
roaster2 = Roaster.create!(name: "Golden Roast", location: "Seattle, USA", bio: "Especialistas en café de especialidad con tueste medio.")
# Crear usuarios
user1 = User.create!(email: "coffee_lover@example.com", bio: "Apasionado del café de especialidad.")
user2 = User.create!(email: "barista_pro@example.com", bio: "Barista profesional y amante del V60.")
# Crear granos de café (Beans)
bean1 = Bean.create!(name: "Geisha", origin: "Panamá", tasting_notes: "Notas florales, jazmín, miel", roaster: roaster1, roasted_at: 10.days.ago)
bean2 = Bean.create!(name: "Bourbon", origin: "El Salvador", tasting_notes: "Cacao, almendra, frutos rojos", roaster: roaster2, roasted_at: 25.days.ago)
# Crear recetas (Recipes)
Recipe.create!(
  title: "V60 Perfecto",
  description: "Una receta balanceada para preparar café en V60.",
  difficulty: 3,
  user: user1
)
Recipe.create!(
  title: "Aeropress con cuerpo",
  description: "Método rápido y con cuerpo para preparar Aeropress.",
  difficulty: 1,
  user: user2
)
RecipeBean.create!(recipe: Recipe.last, bean: bean1, amount: 18)
RecipeBean.create!(recipe: Recipe.last, bean: bean2, amount: 18)


puts "Seeding completed!"