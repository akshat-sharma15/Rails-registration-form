class CreateSubjects < ActiveRecord::Migration[7.0]
  def change
    create_table :subjects do |t|
      t.string :sub_name
      t.string :sub_code
      t.text :details
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
