import Foundation
import BlueIDAccessSDK

class Device: ObservableObject, Identifiable {
    @Published public var id: String = ""
    @Published public var distance: Float = 0
    
    init(_ device: BlueDeviceInfo) {
        self.id = device.deviceID
        self.distance = device.distanceMeters
    }
}
