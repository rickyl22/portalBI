class CreateDocumentos < ActiveRecord::Migration[5.1]
  def change
    create_table :documentos do |t|
      t.string :titulo
      t.text :path

      t.timestamps
    end
  end
end
