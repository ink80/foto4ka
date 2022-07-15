class CreateProfile < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :bio
    end

    add_reference :profiles, :user, foreign_key: true, index: { unique: true }

  end
end
