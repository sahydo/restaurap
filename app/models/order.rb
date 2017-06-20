# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  orderdate  :datetime         not null
#  pinwaiter  :integer          not null
#  pinchef    :integer
#  attenddate :datetime
#  payvalue   :integer          not null
#  status     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  table_id   :integer
#

class Order < ActiveRecord::Base
    enum status: { wait: 0, process: 1, ready: 2}
    after_initialize :set_default_values, :if => :new_record? 

    def set_default_values 
        self.status ||= :wait
        self.orderdate = Time.now
        self.attenddate = Time.now
        self.payvalue = 0
    end
end
