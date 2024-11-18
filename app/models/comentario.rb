class Comentario < ApplicationRecord
  belongs_to :usuario
  belongs_to :postagem

  # Construtor
  def initialize(attributes = {})
    super
  end

  def autor?(usuario)
    self.usuario == usuario
  end

  # Exibir nome do autor
  def nome_autor
    self.usuario.nome
  end
end
