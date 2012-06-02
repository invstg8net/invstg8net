class CreateAnswersTable < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.boolean :answered, :default => false
      t.text :answer
      t.integer :researcher_id
      t.timestamps
    end
  end
end
