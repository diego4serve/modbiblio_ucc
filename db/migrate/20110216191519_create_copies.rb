class CreateCopies < ActiveRecord::Migration
  def self.up
    create_table :copies do |t|
      t.string :code
      t.integer :book_id

      t.timestamps
    end
  end

  def self.down
    drop_table :copies
  end
end
