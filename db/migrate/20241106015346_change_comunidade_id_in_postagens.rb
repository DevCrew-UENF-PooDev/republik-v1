class ChangeComunidadeIdInPostagens < ActiveRecord::Migration[7.2]
  def change
    change_column :postagens, :comunidade_id, :integer, null: true
  end
end
