class Usuario < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :postagens
  has_many :comentarios
  has_many :comunidades_criadas, class_name: "Comunidade", foreign_key: :administrador_id
  has_many :membros
  has_many :comunidades, through: :membros
  has_many :reacoes
  has_many :seguindo, class_name: "Seguindo", foreign_key: "usuario_id"
  has_many :seguidores, class_name: "Seguindo", foreign_key: "seguidor_id"
  has_many :notificacoes, class_name: "Notificacao", foreign_key: "usuario_id"

  has_many :seguindo_usuarios, through: :seguindo, source: :seguidor
  has_many :seguidores_usuarios, through: :seguidores, source: :usuario

  def friends
    self.seguindo_usuarios.select { |friend| friend.seguindo_usuarios.include?(self) }
  end

  def is_friend?(friend)
    self.seguindo_usuarios.include?(friend) && friend.seguindo_usuarios.include?(self)
  end

  def online?
    ultima_vez_visto_em && ultima_vez_visto_em > 5.minutes.ago
  end

  def enviar_notificacao(acao, alvo)
    Notificacao.create!(
      usuario: alvo,               # O alvo da notificação (quem vai receber)
      acao: acao,                  # A ação (ex: "foi seguido")
      alvo_id: self.id,            # O ID do usuário que fez a ação
      alvo_type: "Usuario"         # O tipo do alvo, neste caso 'Usuario'
    )
  end
end
