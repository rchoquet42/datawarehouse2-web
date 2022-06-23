class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|

      t.belongs_to :user
      t.text :about
      t.text :contact


      t.timestamps
    end
  end
end
