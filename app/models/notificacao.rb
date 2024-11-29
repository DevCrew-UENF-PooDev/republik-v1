class Notificacao < ApplicationRecord
  belongs_to :usuario
  # Polimorfismo para permitir notificações para diferentes tipos de alvo (usuário, comentário, post, reação...)
  belongs_to :alvo, polymorphic: true

  scope :nao_lidas, -> { where(lida: false) } # Filtro para pegar notificações não lidas

  def marcar_como_lida
    update(lida: true)
  end
end
