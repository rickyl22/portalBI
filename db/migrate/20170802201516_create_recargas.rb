class CreateRecargas < ActiveRecord::Migration[5.1]
  def change
    create_table :recargas do |t|
      t.date :FECHA
      t.integer :CLIENTES
      t.integer :RECARGAS
      t.float :BS_TOTAL
      t.float :BS_TOTAL_IVA12
      t.float :BS_TOTAL_IVA10
      t.float :FISICA
      t.float :FISICA_BSF
      t.float :FISICA_BSF_SINIVA12
      t.float :FISICA_BSF_SINIVA10
      t.float :P2P
      t.float :P2P_BSF
      t.float :P2P_BSF_SINIVA12
      t.float :P2P_BSF_SINIVA10
      t.float :GRE
      t.float :GRE_BSF
      t.float :GRE_BSF_SINIVA12
      t.float :GRE_BSF_SINIVA10
      t.float :BANCARIA
      t.float :BANCARIA_BSF
      t.float :BANCARIA_BSF_SINIVA12
      t.float :BANCARIA_BSF_SINIVA10
      t.float :MMO
      t.float :MMO_BSF
      t.float :MMO_BSF_SINIVA12
      t.float :MMO_BSF_SINIVA10
      t.float :TRANSFERENCIA
      t.float :TRANSFERENCIA_BSF
      t.float :TRANSFERENCIA_BSF_SINIVA12
      t.float :TRANSFERENCIA_BSF_SINIVA10

      t.timestamps
    end
  end
end
