class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.references :board  
		  t.references :user
      t.timestamps
    end
  end
end
