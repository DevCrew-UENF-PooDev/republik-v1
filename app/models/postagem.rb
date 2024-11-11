class Postagem < ApplicationRecord
  belongs_to :usuario
  belongs_to :comunidade, optional: true
  has_many :comentarios, dependent: :destroy

  validate :usuario_deve_participar_da_comunidade, if: -> { comunidade.present? }

  private

  def usuario_deve_participar_da_comunidade
    unless comunidade.usuarios.include?(usuario)
      errors.add(:usuario, "não faz parte da comunidade")
    end
  end
end
