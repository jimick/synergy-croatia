# This migration comes from synergy_engine (originally 20130726130519)
class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title_en
      t.string :title_hr
      t.text :body_en
      t.text :body_hr

      t.timestamps
    end
  end
end
