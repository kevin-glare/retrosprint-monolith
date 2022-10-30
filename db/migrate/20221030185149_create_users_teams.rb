class CreateUsersTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :users_teams, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid, index: true
      t.references :team, null: false, foreign_key: true, type: :uuid, index: true
      t.datetime :deleted_at, index: true

      t.timestamps
    end

    add_index :users_teams, [:user_id, :team_id], unique: :true, where: "deleted_at IS NULL"
  end
end
