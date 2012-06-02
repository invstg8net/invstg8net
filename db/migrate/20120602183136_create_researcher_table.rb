class CreateResearcherTable < ActiveRecord::Migration
  def change
    create_table :researchers do |t|
      t.timestamps
    end
  end
end
