class CreateDocumentos < ActiveRecord::Migration[5.1]
  def change
    create_table :documentos do |t|
      t.string :nombre
      t.string :attachment
      t.string :estatus
      t.belongs_to :caso

      t.timestamps
    end
  end
end
