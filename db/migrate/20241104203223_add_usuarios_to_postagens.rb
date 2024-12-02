class AddUsuariosToPostagens < ActiveRecord::Migration[7.2]
  def change
    add_reference :postagens, :usuario, null: false, foreign_key: true
  end
end
