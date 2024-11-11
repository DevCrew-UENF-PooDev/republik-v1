class Comunidade < ApplicationRecord
  belongs_to :administrador, class_name: "Usuario" , foreign_key: :administrador_id
  has_many :postagens
  has_many :membros
  has_many :usuarios, through: :membros
end
