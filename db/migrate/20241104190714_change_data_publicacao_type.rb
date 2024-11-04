class ChangeDataPublicacaoType < ActiveRecord::Migration[7.2]
  def change
    change_column :postagens, :data_publicacao, :datetime
  end
end
