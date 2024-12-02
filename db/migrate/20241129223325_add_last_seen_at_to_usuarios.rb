class AddLastSeenAtToUsuarios < ActiveRecord::Migration[7.2]
  def change
    add_column :usuarios, :ultima_vez_visto_em, :datetime
  end
end
