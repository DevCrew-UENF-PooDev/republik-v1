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

  has_many :seguindo_usuarios, through: :seguindo, source: :seguidor
  has_many :seguidores_usuarios, through: :seguidores, source: :usuario

  def friends
    self.seguindo_usuarios.select { |friend| friend.seguindo_usuarios.include?(self) }
  end

  def is_friend?(friend)
    self.seguindo_usuarios.include?(friend) && friend.seguindo_usuarios.include?(self)
  end
end
