class Addforeingkeytoauthors < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :authors, :users
  end
end
