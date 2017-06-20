class ChangeColumnAttendDateFromOrder < ActiveRecord::Migration
  def change
    change_column :orders, :attenddate, :datetime, null: true
  end
end
