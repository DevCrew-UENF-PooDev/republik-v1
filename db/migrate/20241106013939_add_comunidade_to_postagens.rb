class AddComunidadeToPostagens < ActiveRecord::Migration[7.2]
  def change
    add_reference :postagens, :comunidade, null: false, foreign_key: true
  end
end
