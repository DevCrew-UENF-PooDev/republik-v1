class Postagem < ApplicationRecord
  belongs_to :usuario
  belongs_to :comunidade, optional: true
  has_many :comentarios, dependent: :destroy
  has_many :reacoes, dependent: :destroy

  has_many_attached :imagens

  validate :imagens_limit

  validates :titulo, presence: { message: "Título é obrigatório." }
  validates :conteudo, presence: { message: "Conteúdo é obrigatório." }
  validates :titulo, length: { minimum: 5, message: "O Título deve ter pelo menos 5 caracteres." }

  validate :usuario_deve_participar_da_comunidade, if: -> { comunidade.present? }

  # Funcoes
  def resumo
    "#{self.conteudo.truncate(500)}"
  end

  def usuario_reagiu?(usuario)
    self.reacoes.exists?(usuario: usuario)
  end

  def total_comentarios
    self.comentarios.count
  end

  def total_reacoes
    self.reacoes.count
  end

  def delete_post(user)
    if self.usuario == user or (self.comunidade.present?() and self.comunidade.is_user_admin(user))
      self.comentarios.destroy_all
      self.reacoes.destroy_all
      self.delete()
    else
      errors.add(:base, "Você não tem permissão para deletar esse post!")
    end
  end

  def enviar_notificacao(acao, alvo)
    Notificacao.create!(
      usuario: alvo,               # O alvo da notificação (quem vai receber)
      acao: acao,                  # A ação (ex: "foi seguido")
      alvo_id: self.id,            # O ID da postagem
      alvo_type: "Postagem"         # O tipo do alvo, neste caso 'Postagem'
    )
  end

  private

  def usuario_deve_participar_da_comunidade
    unless comunidade.usuarios.include?(usuario)
      errors.add(:usuario, "não faz parte da comunidade")
    end
  end

  def imagens_limit
    errors.add(:imagens, "não pode ter mais de 2 imagens") if imagens.size > 2
  end
end
