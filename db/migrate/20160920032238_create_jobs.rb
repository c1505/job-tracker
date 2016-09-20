class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :location
      t.integer :salary
      t.text :body
      t.boolean :interested
      t.boolean :contacted
      t.datetime :interview_date
      t.string :contacts
      t.text :company_info
      t.text :learn_technical
      t.text :build
      t.string :next_step
      t.string :title
      t.string :company
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
