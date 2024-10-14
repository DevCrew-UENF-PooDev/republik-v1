class CreateComunidades < ActiveRecord::Migration[7.2]
  def change
    create_table :comunidades do |t|
      t.timestamps
      t.string :nome
      t.string :descricao
      t.date :data_criacao
    end
  end
end
