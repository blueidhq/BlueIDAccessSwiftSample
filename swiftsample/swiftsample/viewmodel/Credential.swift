import Foundation
import BlueIDAccessSDK

class Credential: ObservableObject, Identifiable {
    public let id: String
    @Published public var name: String = ""
    @Published public var siteName: String = ""
    @Published public var validFrom: String = ""
    @Published public var validTo: String = ""
    @Published public var validity: String = ""
    
    init(_ credential: BlueAccessCredential) {
        self.id = credential.credentialID.id
        self.name = credential.name
        self.siteName = credential.siteName
        self.validFrom = Credential.formatDate(date: credential.validFrom)
        self.validTo = Credential.formatDate(date: credential.validTo)
        self.validity = Credential.formatDate(date: credential.validity)
    }
    
    static func formatDate(date: BlueLocalTimestamp) -> String {
        guard let date = date.toUTCDate() else {
            return "n/d"
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.string(from: date)
    }
}
