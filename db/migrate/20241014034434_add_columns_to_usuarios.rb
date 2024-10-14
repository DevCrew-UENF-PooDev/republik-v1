class AddColumnsToUsuarios < ActiveRecord::Migration[7.2]
  def change
    add_column :usuarios, :username, :string
    add_column :usuarios, :nome, :string
    add_column :usuarios, :curso, :string
    add_column :usuarios, :instituicao, :string
  end
end
