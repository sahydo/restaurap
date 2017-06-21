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
    validates :orderdate, :presence => {:message => "The orderdate is required."}
    validates :pinwaiter, :presence => {:message => "The pinwaiter is required."}
    validates :payvalue, :presence => {:message => "The payvalue is required."}
    validates :status, :presence => {:message => "The status is required."}
    # Validamos en una expresion regular
    VALID_NUMBER_REGEX = /\A[0-9]+\z/i
    validates :payvalue, format: { :with => VALID_NUMBER_REGEX , message: "Only numbers" }

    def set_default_values 
        self.status ||= :wait
        self.orderdate = Time.now
        self.attenddate = Time.now
        self.payvalue = 0
    end
end
