class Reacao < ApplicationRecord
  belongs_to :usuario
  belongs_to :postagem
end
