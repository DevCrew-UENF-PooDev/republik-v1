class Comunidade < ApplicationRecord
  belongs_to :administrador, class_name: "Usuario", foreign_key: :administrador_id
  has_many :postagens
  has_many :membros
  has_many :usuarios, through: :membros

  def ultima_atividade
    postagem_recente = postagens.order(updated_at: :desc).first
    if postagem_recente
      "Última atividade há #{ActionController::Base.helpers.time_ago_in_words(postagem_recente.updated_at)}"
    else
      "Nenhuma atividade recente"
    end
  end
end
