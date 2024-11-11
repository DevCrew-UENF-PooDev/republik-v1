class RemoveComunidadeAdministradaIdFromUsuarios < ActiveRecord::Migration[7.2]
  def change
    remove_column :usuarios, :comunidade_administrada_id, :integer
  end
end
