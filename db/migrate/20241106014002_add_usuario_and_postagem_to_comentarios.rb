class AddUsuarioAndPostagemToComentarios < ActiveRecord::Migration[7.2]
  def change
    add_reference :comentarios, :usuario, null: false, foreign_key: true
    add_reference :comentarios, :postagem, null: false, foreign_key: true
  end
end
