class AddActivatedFieldToUser < ActiveRecord::Migration
  def change
    add_column :researchers, :activated, :boolean, :default => false
  end
end
