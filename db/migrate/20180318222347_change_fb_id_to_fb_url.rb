class ChangeFbIdToFbUrl < ActiveRecord::Migration[5.1]
  def change
    rename_column :events, :fb_id, :fb_url
  end
end
