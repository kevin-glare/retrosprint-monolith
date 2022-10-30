class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid, index: true
      t.text :content
      t.references :chat, polymorphic: true, null: false, type: :uuid, index: true
      t.datetime :deleted_at, index: true

      t.timestamps
    end
  end
end
