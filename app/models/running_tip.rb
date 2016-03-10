class RunningTip < ActiveRecord::Base
  validates :tip, presence: true
end
