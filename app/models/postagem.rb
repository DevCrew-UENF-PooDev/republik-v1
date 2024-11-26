class Postagem < ApplicationRecord
  belongs_to :usuario
  belongs_to :comunidade, optional: true
  has_many :comentarios, dependent: :destroy
  has_many :reacoes, dependent: :destroy

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
    self.reacoes.count # Mudar futuramente
  end

  private

  def usuario_deve_participar_da_comunidade
    unless comunidade.usuarios.include?(usuario)
      errors.add(:usuario, "não faz parte da comunidade")
    end
  end
end
