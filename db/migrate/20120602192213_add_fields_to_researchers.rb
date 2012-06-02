class AddFieldsToResearchers < ActiveRecord::Migration
  def change
    add_column :researchers, :email, :string
    add_column :researchers, :mobile_number, :string
    add_column :researchers, :phone_number, :string
    add_column :researchers, :name, :string
  end
end
