class Comentario < ApplicationRecord
  belongs_to :usuario
  belongs_to :postagem

  validates :conteudo, presence: { message: "Conteúdo é obrigatório." }
  validates :conteudo, length: { minimum: 5, message: "O conteúdo deve ter pelo menos 5 caracteres." }

  def autor?(usuario)
    self.usuario == usuario
  end

  # Exibir nome do autor
  def nome_autor
    self.usuario.nome
  end
end
