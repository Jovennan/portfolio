class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :description
      t.references :programmer, foreign_key: true
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
