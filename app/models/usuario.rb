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

  validates :nome, presence: { message: "Nome é obrigatório." }
  validates :username, presence: { message: "Username é obrigatório." }

  def friends
    self.seguindo_usuarios.select { |friend| friend.seguindo_usuarios.include?(self) }
  end

  def is_friend?(friend)
    self.seguindo_usuarios.include?(friend) && friend.seguindo_usuarios.include?(self)
  end

  def friend_status(friend)
    friend_send_request = friend.seguindo_usuarios.include?(self)
    user_send_request = self.seguindo_usuarios.include?(friend)
    if user_send_request && friend_send_request
      :friends # Desfazer Amizade
    elsif friend_send_request
      :request_received # Aceitar ou Recusar
    elsif user_send_request
      :request_sent # Cancelar
    else
      :not_friends # Enviar Pedido
    end
  end

  def accept_friend_request(friend)
    if not self.seguindo_usuarios.include?(friend) and friend.seguindo_usuarios.include?(self)
      self.seguindo_usuarios << friend
      enviar_notificacao("aceitou seu pedido de amizade", friend)
    end
  end

  def decline_friend_request(friend)
    if friend.seguindo_usuarios.include?(self)
      friend.seguindo_usuarios.delete(self)
    end
  end

  def cancel_friend_request(friend)
    if self.seguindo_usuarios.include?(friend)
      self.seguindo_usuarios.delete(friend)
    end
  end

  def send_friend_request(friend)
    if not self.seguindo_usuarios.include?(friend)
      self.seguindo_usuarios << friend
      enviar_notificacao("foi seguido", friend) # Notifica o amigo
    end
  end

  # def send_friend_request(friend)
  #   if self.seguindo_usuarios.include?(friend)
  #     self.seguindo_usuarios.delete(friend) # Cancela o pedido de amizade
  #   else
  #     self.seguindo_usuarios << friend
  #     enviar_notificacao("foi seguido", friend) # Notifica o amigo
  #   end
  # end

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
