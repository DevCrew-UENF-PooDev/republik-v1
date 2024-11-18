class Reacao < ApplicationRecord
  self.table_name = "reacaos"
  belongs_to :usuario
  belongs_to :postagem

  validates :tipo, presence: true
end
