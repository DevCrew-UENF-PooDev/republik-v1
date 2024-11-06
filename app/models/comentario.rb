class Comentario < ApplicationRecord
  belongs_to :usuario
  belongs_to :postagem
end
