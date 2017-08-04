class CreateAltasPlans < ActiveRecord::Migration[5.1]
  def change
    create_table :altas_plans do |t|
      t.date :fecha
      t.string :plan
      t.integer :cantidad
      t.string :plataforma

      t.timestamps
    end
  end
end
