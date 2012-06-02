class CreateQuestionsTable < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :email
      t.string :phone_number
      t.text :body
      t.timestamps
      t.boolean :escalated, :default => :false
      t.datetime :needed_by
    end
  end
end
