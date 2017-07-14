class CreateKpis < ActiveRecord::Migration[5.1]
  def change
    create_table :kpis do |t|
      t.text :nombre
      t.text :descripcion
      t.text :portada
      t.text :dashboard
      t.text :url

      t.timestamps
    end
  end
end
