

import SwiftUI

struct DismissButton: View {
    let item: TunaModel
    @Binding var isShowingModal: Bool
    var shoppingCosmetic : TunaModel
    var body: some View {
        VStack{
            HStack{
                Spacer()
                
                
                Text ( "rollo de \(item.name)")
                    .font(.custom("GillSans", size: 35))
//                    .font(.largeTitle)
//                    .fontWeight(.heavy)
                    .foregroundColor(Color.blue)
                    .padding(.trailing,25)
                  .minimumScaleFactor(0.3)
               .lineLimit(2)
            Button {
                isShowingModal = false
            } label: {
                Image(systemName: "xmark")
                    .imageScale(.large)
                    .foregroundColor(Color.white)

                    .frame(width: 34, height: 34)
                    .background(Color.blue)

                    .cornerRadius(20)
                    .overlay(
                        
                        Circle()
                            .stroke(Color.blue, lineWidth: 1))
            }
            .padding(.horizontal,25)

            

//            Color(UIColor(red:  CGFloat(Float(shoppingCosmetic.backgroundColorProduct[0])!/256), green:  CGFloat(Float(shoppingCosmetic.backgroundColorProduct[1])!/256), blue:  CGFloat(Float(shoppingCosmetic.backgroundColorProduct[2])!/256), alpha: 1))
//
        
            }
        }
    }
}

//struct DismissButton_Previews: PreviewProvider {
//    static var previews: some View {
//        DismissButton(isShowingModal: .constant(false), shoppingCosmetic: TunaModel)
//    }
//}
