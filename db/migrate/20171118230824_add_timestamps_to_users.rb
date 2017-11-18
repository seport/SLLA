class AddTimestampsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_timestamps(:users, default: Time.zone.now, null: false)
  end
end
