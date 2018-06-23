class AddUseridToCalendar < ActiveRecord::Migration[5.2]
  def change
    add_column :calendars, :userid, :string
  end
end
