class AddAdmToComunidades < ActiveRecord::Migration[7.2]
  def change
    add_column :usuarios, :comunidade_administrada_id, :integer
    add_foreign_key :usuarios, :comunidades, column: :comunidade_administrada_id
    add_index :usuarios, :comunidade_administrada_id
  end
end
