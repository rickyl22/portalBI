class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	 t.string :title
      t.text :text
    end
  end
end
