class Interface < ApplicationRecord
    belongs_to :device
    has_one :interface, class_name: "Interface", foreign_key: "peer_interface_id"
    belongs_to :peer_interface, class_name: "Interface", optional: true
end
