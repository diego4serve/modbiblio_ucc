class AddUnavailableToCopy < ActiveRecord::Migration
  def self.up
    add_column :copies, :unavailable, :boolean, :default => false
  end

  def self.down
    remove_column :copies, :unavailable
  end
end
