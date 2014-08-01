class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user, index: true
      t.references :post, index: true
      t.integer :value

      t.timestamps
    end
  end
end
