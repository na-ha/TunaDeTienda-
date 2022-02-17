//
//  DetailTwo.swift
//  Apple Frameworks
//
//  Created by MacMini on 2/13/22.
//


//  FrameworkDetailView.swift
//  Apple Frameworks
//
//  Created by Oscar Santos on 11/5/20.
//

import SwiftUI

struct DetailViewthree: View {
    
//    var framework: Framework
    @EnvironmentObject var order: Order
    @Binding var isShowingDetailView: Bool
    @State private var isShowingSafariView = false
//    var tuna: Tuna
 //    @EnvironmentObject var order: Order
    var item: Tuna

    var body: some View {
        VStack {
            DismissButton(isShowingModal: $isShowingDetailView)
            
            Spacer()
            
            TunaItemDetailViewHelper(item: item)
            
            Text(item.name)
                .font(.body)
                .padding()
            Image(item.image)
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(5)
            Spacer()
//            StepperView(cartItems: $cartItems, menuItem: tuna)
            
            
        }
        
            HStack{
                Text("add to cart")

                Text("checkout")

            }
        }
        
    }

//
//struct FrameworkDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        FrameworkDetailView(framework: MockData.sampleFramework, isShowingDetailView: .constant(false))
//            .preferredColorScheme(.dark)
//    }
//}
