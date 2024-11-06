class Seguindo < ApplicationRecord
  belongs_to :usuario, class_name: "Usuario"
  belongs_to :seguidor, class_name: "Usuario"
end
