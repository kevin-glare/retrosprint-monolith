class CreateRetros < ActiveRecord::Migration[7.0]
  def change
    create_table :retros, id: :uuid do |t|
      t.references :team, null: false, foreign_key: true, type: :uuid, index: true
      t.datetime :deleted_at, index: true

      t.timestamps
    end
  end
end
