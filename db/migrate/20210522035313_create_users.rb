class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :name
      t.string :password
			t.string :token			


      t.timestamps
    end
  end
end
