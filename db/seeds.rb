# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# db/seeds.rb

# Criação de usuários usando Devise
Usuario.create!(
  [
    {
      username: 'user1',
      email: 'user1@example.com',
      password: 'password1',
      password_confirmation: 'password1',
      nome: 'User One',
      curso: 'Engenharia',
      instituicao: 'Universidade A'
    },
    {
      username: 'user2',
      email: 'user2@example.com',
      password: 'password2',
      password_confirmation: 'password2',
      nome: 'User Two',
      curso: 'Medicina',
      instituicao: 'Universidade B'
    },
    {
      username: 'user3',
      email: 'user3@example.com',
      password: 'password3',
      password_confirmation: 'password3',
      nome: 'User Three',
      curso: 'Direito',
      instituicao: 'Universidade C'
    },
    {
      username: 'user4',
      email: 'user4@example.com',
      password: 'password4',
      password_confirmation: 'password4',
      nome: 'User Four',
      curso: 'Matemática',
      instituicao: 'Universidade D'
    },
    {
      username: 'user5',
      email: 'user5@example.com',
      password: 'password5',
      password_confirmation: 'password5',
      nome: 'User Five',
      curso: 'História',
      instituicao: 'Universidade E'
    }
  ]
)

puts "Usuários criados com sucesso!"
