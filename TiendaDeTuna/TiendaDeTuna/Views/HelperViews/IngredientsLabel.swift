import SwiftUI

struct IngredientsLabel: View {
    @StateObject var gridViewModel = GridViewModel()
   @StateObject var modelData = ModelData()
    @State private var isExpanded = false
    var shoppingCosmetic : TunaModel
    var item: TunaModel

    var body: some View {
        HStack{
            VStack
            { HStack(spacing: 20)
                {LazyVGrid(columns: gridViewModel.twoColumns ,spacing: 2)
                    {ForEach(0 ..< item.genre.count, id: \.self)
                        { index in
                        VStack
                        { Image(item.genre[index].rawValue)
                           .resizable()
                              .aspectRatio(contentMode: .fit)
                                .frame(width: isExpanded ? 150 : 90, height: isExpanded ? 150 : 90)
                                  .padding(.horizontal, isExpanded ? 10 : 0)
                                    .shadow(color: .black, radius: 10, x: 5, y: 5)
                                     .onTapGesture { withAnimation { isExpanded.toggle() }}
                            VStack
                            {Text(item.genre[index].rawValue)}
                            .scaledToFit()
                            .minimumScaleFactor(0.8)
                            .foregroundColor(Color.black)
                            .padding(4.2)
                            .overlay( RoundedRectangle(cornerRadius: 20)
                                    .stroke( Color(UIColor(red:  CGFloat(Float(shoppingCosmetic.backgroundColorProduct[0])!/256), green:  CGFloat(Float(shoppingCosmetic.backgroundColorProduct[1])!/256), blue:  CGFloat(Float(shoppingCosmetic.backgroundColorProduct[2])!/256), alpha: 1)), lineWidth: 1.8) )       } } } } }
            .padding(.horizontal) }}}
