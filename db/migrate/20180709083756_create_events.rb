class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.datetime :start_time
      t.datetime :end_time
      t.string :recurring
      t.string :reminder
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
