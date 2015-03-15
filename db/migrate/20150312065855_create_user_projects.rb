class CreateUserProjects < ActiveRecord::Migration
  def change
    create_table :user_projects do |t|
      t.references :user, index: true
      t.references :project, index: true
      t.boolean :admin

      t.timestamps null: false
    end
    add_foreign_key :user_projects, :users
    add_foreign_key :user_projects, :projects
  end
end
