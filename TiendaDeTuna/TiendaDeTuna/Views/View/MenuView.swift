

import SwiftUI

struct MenuView: View {

    var body: some View {
        VStack {
            NavigationLink(destination: OrderView()) {
                HStack(spacing: 15) {
                    Image(systemName: "cart")
                        .font(.title)
                        .foregroundColor(Color.yellow)
                    
                    Text("Cart")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    Spacer(minLength: 0)
                }
                .padding()
            }
            
            Spacer()
            
            HStack {
                Spacer()
                
                Text("Version 0.1")
                    .fontWeight(.bold)
                    .foregroundColor(Color.yellow)
            }
            .padding(10)
        }
        .padding([.top, .trailing])
        .frame(width: UIScreen.main.bounds.width / 1.6)
        .background(Color.white.ignoresSafeArea())
    }
}
