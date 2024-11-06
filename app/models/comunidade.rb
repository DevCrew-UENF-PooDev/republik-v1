class Comunidade < ApplicationRecord
  belongs_to :administrador, class_name: "Usuario"
  has_many :postagens
end
