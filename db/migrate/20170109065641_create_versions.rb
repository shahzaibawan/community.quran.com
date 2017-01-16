class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.references :item, polymorphic: true, null: false
      t.string   :event,     null: false
      t.string   :whodunnit
      t.text     :object
      t.datetime :created_at
    end
  end
end
