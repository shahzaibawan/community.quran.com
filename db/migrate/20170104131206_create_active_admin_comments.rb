class CreateActiveAdminComments < ActiveRecord::Migration
  def self.up
    create_table :active_admin_comments do |t|
      t.string :namespace, index: true
      t.text   :body
      t.references :resource, polymorphic: true, null: false
      t.references :author, polymorphic: true
      t.timestamps
    end
  end

  def self.down
    drop_table :active_admin_comments
  end
end
