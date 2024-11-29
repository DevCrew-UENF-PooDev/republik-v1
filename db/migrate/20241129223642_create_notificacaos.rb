class CreateNotificacaos < ActiveRecord::Migration[7.2]
  def change
    create_table :notificacaos do |t|
      t.references :usuario, null: false, foreign_key: true
      t.string :acao
      t.integer :alvo_id
      t.string :alvo_type
      t.boolean :lida, default: false

      t.timestamps
    end
  end
end
