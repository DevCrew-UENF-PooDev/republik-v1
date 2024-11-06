class CreateReacaos < ActiveRecord::Migration[7.2]
  def change
    create_table :reacaos do |t|
      t.string :tipo
      t.references :usuario, null: false, foreign_key: true
      t.references :postagem, null: false, foreign_key: true

      t.timestamps
    end
  end
end
