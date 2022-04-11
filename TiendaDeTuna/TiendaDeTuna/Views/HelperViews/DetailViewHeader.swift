import SwiftUI

struct DetailViewHeader: View {
    let item: TunaModel
    
    @EnvironmentObject var order: OrderViewModel
    @State private var showAlert = false
    @State private var isAnimatingImage: Bool = false
    @Binding var revealDetails: Bool
    var shoppingCosmetic : TunaModel
    
    var body: some View{
        ZStack(alignment: .top)
        { Color(UIColor(red:  CGFloat(Float(shoppingCosmetic.backgroundColorProduct[0])!/256), green:  CGFloat(Float(shoppingCosmetic.backgroundColorProduct[1])!/256), blue:  CGFloat(Float(shoppingCosmetic.backgroundColorProduct[2])!/256), alpha: 1))
        
        VStack
            {Text (item.headline)
                .font(.custom("GillSans", size: 40))
                      .padding(.horizontal)
                .foregroundColor(Color.black)
            if revealDetails == false
            {Image(item.image)
      .aspectRatio(contentMode: .fit)
        .padding(.horizontal)
         .scaleEffect(isAnimatingImage ? 1.2 : 0.3)
        .shadow(color: .gray, radius: 10, x: 5, y: 5)
        .frame(height: 300)
        .onAppear()
                {withAnimation(.easeOut(duration: 0.9))
                    {isAnimatingImage = true}   }
                
            }}}}}
