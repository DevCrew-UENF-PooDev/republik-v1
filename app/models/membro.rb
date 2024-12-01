class Membro < ApplicationRecord
  belongs_to :usuario
  belongs_to :comunidade
end
