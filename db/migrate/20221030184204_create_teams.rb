class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams, id: :uuid do |t|
      t.string :title
      t.datetime :deleted_at, index: true
      t.timestamps
    end
  end
end
