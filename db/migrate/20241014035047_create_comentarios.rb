class CreateComentarios < ActiveRecord::Migration[7.2]
  def change
    create_table :comentarios do |t|
      t.timestamps
      t.string :conteudo
      t.date :data_comentario
    end
  end
end
