import SwiftUI
import BlueIDAccessSDK

struct DevicesView: View {
    @ObservedObject private var devices = Devices()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Nearby Devices")
                .font(.headline)
                .padding(.bottom, 10)
            
            if devices.list.isEmpty {
                Text("No nearby devices")
                    .font(.footnote)
            }
            
            List(devices.list) { item in
                HStack() {
                    VStack(alignment: .leading) {
                        Text("ID: \(item.id)")
                            .font(.headline)
                        Text("Distance: \(item.distance)")
                            .font(.subheadline)
                    }
                    Spacer()
                    Button("Unlock") {
                        tryAccessDevice(item)
                    }
                }
            }
        }
        .padding()
        .onAppear() {
            if !blueCommands.isScanningActive.run() {
                do {
                    try blueCommands.startScanning.run()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func tryAccessDevice(_ device: Device) {
        Task {
            do {
                let result = try await blueCommands.tryAccessDevice.runAsync(deviceID: device.id)
                if result.accessGranted {
                    print("OK")
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    DevicesView()
}
