class CreatePostagens < ActiveRecord::Migration[7.2]
  def change
    create_table :postagens do |t|
      t.timestamps
      t.string :titulo
      t.string :conteudo
      t.date :data_publicacao
    end
  end
end
