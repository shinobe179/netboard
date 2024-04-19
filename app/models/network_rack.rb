class NetworkRack < ApplicationRecord
    belongs_to :datacenter
    has_many :devices
end
