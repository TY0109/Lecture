class AddUniInfoToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :university, :string
    add_column :posts, :department, :string
  end
end
