import Foundation
import BlueIDAccessSDK

class Devices: ObservableObject, BlueEventListener {
    @Published public var list: [Device] = []
    
    init() { blueAddEventListener(listener: self) }
    
    deinit { blueRemoveEventListener(listener: self) }
    
    func blueEvent(event: BlueEventType, data: Any?) {
        switch (event) {
        case .deviceAdded: list.append(Device(data as! BlueDeviceInfo))
        case .deviceRemoved: list.removeAll { $0.id == (data as! BlueDeviceInfo).deviceID }
        default: break
        }
    }
}
