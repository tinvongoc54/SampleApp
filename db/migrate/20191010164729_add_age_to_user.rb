class AddAgeToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :age, :integer, after_column: :email
  end
end
