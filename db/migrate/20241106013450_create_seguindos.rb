class CreateSeguindos < ActiveRecord::Migration[7.2]
  def change
    create_table :seguindos do |t|
      t.integer :usuario_id
      t.integer :seguidor_id

      t.timestamps
    end
  end
end
