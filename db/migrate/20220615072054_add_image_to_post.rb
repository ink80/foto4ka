class AddImageToPost < ActiveRecord::Migration[7.0]
  def up
    add_column :posts, :image_file_name, :string
    add_column :posts, :image__file_size, :integer
    add_column :posts, :image__content_type, :string
    add_column :posts, :image__updated_at, :datetime
  end

  def down
    remove_column :posts, :image__file_name, :string
    remove_column :posts, :image__file_size, :integer
    remove_column :posts, :image__content_type, :string
    remove_column :posts, :image__updated_at, :datetime
  end
end
