class Comunidade < ApplicationRecord
  belongs_to :administrador, class_name: "Usuario", foreign_key: :administrador_id
  has_many :postagens
  has_many :membros
  has_many :usuarios, through: :membros

  validates :nome, presence: { message: "Nome é obrigatório." }
  validates :nome, length: { minimum: 5, message: "O Nome da comunidade deve ter pelo menos 5 caracteres." }

  def last_activity
    postagem_recente = postagens.order(updated_at: :desc).first
    if postagem_recente
      "Última atividade há #{ActionController::Base.helpers.time_ago_in_words(postagem_recente.updated_at)}"
    else
      "Nenhuma atividade recente"
    end
  end

  def is_user_admin(user)
    user == administrador ? true : false
  end

  def participation_status(user)
    if is_user_admin(user)
      :community_admin # É admin da comunidade (não pode sair)
    elsif usuarios.include?(user)
      :community_user # É apenas um usuário da comunidade (pode Sair)
    else
      :community_not_participate # Não participa da comunidade (pode Entrar)
    end
  end

  def enter_community(user)
    user.comunidades << self
  end

  def remove_user_from_community(user)
    if is_user_admin(user)
      errors.add(:base, "O administrador não pode sair da comunidade.")
    else
      usuarios.delete(user)
    end
  end

  def posts
    self.postagens.order(updated_at: :desc)
  end
end
