import SwiftUI
class NavigationManager: ObservableObject{
    @Published private(set) var dest: AnyView? = nil
    @Published var isActive: Bool = false
    static let shared = NavigationManager()
    
    func move(to: AnyView) {
        self.dest = to
        self.isActive = true}}
