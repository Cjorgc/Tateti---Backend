class CreateBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :boards do |t|
      t.string :square00
      t.string :square01
      t.string :square02
      t.string :square10
      t.string :square11
      t.string :square12
      t.string :square20
      t.string :square21
      t.string :square22
			t.string :next_player_expected , default: "X"
			t.boolean :finished, default: false
			t.string :winner		
			t.references :player_x
			t.references :player_o

      t.timestamps
    end

  end

		

end
