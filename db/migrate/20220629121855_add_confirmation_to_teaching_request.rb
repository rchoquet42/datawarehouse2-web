class AddConfirmationToTeachingRequest < ActiveRecord::Migration[7.0]
  def change
    add_column :teaching_requests, :validated?, :boolean, :default => false
    add_column :teaching_requests, :waiting?, :boolean, :default => true
  end
end
