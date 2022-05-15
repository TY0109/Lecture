class AddDepartmentBranchToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :branch, :string
  end
end
