class Users_role < ApplicationRecord
  belongs_to :user
  belongs_to :role
end

