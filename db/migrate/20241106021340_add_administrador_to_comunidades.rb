class AddAdministradorToComunidades < ActiveRecord::Migration[7.2]
  def change
    add_reference :comunidades, :administrador, foreign_key: { to_table: :usuarios }
  end
end
