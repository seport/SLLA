class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.timestamps
      t.string :fb_id
    end
  end
end
