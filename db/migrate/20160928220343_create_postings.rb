class CreatePostings < ActiveRecord::Migration
  def change
    create_table :postings do |t|
      t.string :not_interested
    end
  end
end
