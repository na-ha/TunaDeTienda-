
import SwiftUI

final class GridViewModel: ObservableObject {

    
    var selectedModel: TunaModel? {
        didSet{isShowingDetailView = true}
    }
    @Published var isShowingDetailView = false
    

    
    var columns: [GridItem] =
        Array(repeating: .init(.flexible(), alignment: .center), count: 3)
    
    
    
}
