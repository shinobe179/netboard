import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"

export default class extends Controller {
    static targets = ["peerInterfaces"]
    static values = {
        url: String,
        param: String
    }

    connect(event) {
        let device_id = document.getElementById("interface_id").value[0]
        let target = "interface_peer_interface_id"

        get(`/interfaces/peer_interfaces?target=${target}&device_id=${device_id}`, {
            responseKind: "turbo-stream"
        })
    }

    change(event) {
        console.log("hello")
        let device_id = event.target.selectedOptions[0].value
        let target = this.peerInterfacesTarget.id

        get(`/interfaces/peer_interfaces?target=${target}&device_id=${device_id}`, {
            responseKind: "turbo-stream"
        })
    }
}