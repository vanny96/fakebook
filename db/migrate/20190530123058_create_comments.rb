class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :body
      t.references :user, index: true
      t.references :post, polymorphic: true, index: true

      t.timestamps
    end
  end
end
