class Addpicturepathtoauthor < ActiveRecord::Migration[7.0]
  def change
    change_table :authors do |t|
      t.string :picture_path
    end

  end
end
