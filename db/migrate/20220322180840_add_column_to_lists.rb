class AddColumnToLists < ActiveRecord::Migration[6.1]
  def change
    add_column :lists, :title, :string
  end
end
