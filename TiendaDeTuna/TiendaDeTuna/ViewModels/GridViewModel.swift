import SwiftUI
final class GridViewModel: ObservableObject {
  
    var selectedModel: TunaModel? {
        didSet{showModal = true}}
    @Published var showModal = false
    var columns: [GridItem] =
        Array(repeating: .init(.flexible(), alignment: .center), count: 3)
    var twoColumns: [GridItem] =
        Array(repeating: .init(.flexible(), alignment: .center), count: 2)
}
