

import Foundation

struct TunaModel: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var meatOne: String
    var meatTwo: String
    var description: String
    var price: Double
    var image: String
    var quantity: Int = 0

}
