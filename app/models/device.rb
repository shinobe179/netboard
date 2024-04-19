class Device < ApplicationRecord
    has_many :interfaces
    has_one :device_type
    belongs_to :network_rack
end
