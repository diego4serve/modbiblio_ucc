class CreateRequests < ActiveRecord::Migration
  def self.up
    create_table :requests do |t|
      t.integer :user_id
      t.integer :copy_id
      t.boolean :activated, :default => false
      t.date :request_date, :default => Date.today
      t.date :delivery_date
      t.date :return_date

      t.timestamps
    end
  end

  def self.down
    drop_table :requests
  end
end
