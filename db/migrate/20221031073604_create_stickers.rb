class CreateStickers < ActiveRecord::Migration[7.0]
  def change
    create_table :stickers, id: :uuid do |t|
      t.references :retro, null: false, foreign_key: true, type: :uuid, index: true
      t.references :user, null: false, foreign_key: true, type: :uuid, index: true
      t.string :type,  null: false
      t.text :content, null: false, default: ''
      t.jsonb :data,   null: false, default: {}
      t.datetime :deleted_at, index: true

      t.timestamps
    end
  end
end
