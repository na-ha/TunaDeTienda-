import SwiftUI

struct TunaitemGridViewHelper: View {
    let item: TunaModel
    @State private var degrees = 0.0
    @State var onApp: Bool = true
    @State private var isAnimatingImage: Bool = false

    var body: some View{
        VStack{
            VStack
            {Image(item.image)
    .resizable()
      .aspectRatio(contentMode: .fit)
        .frame(width: 90, height: 90)
        .shadow(color: .black, radius: 10, x: 5, y: 5)
        .rotation3DEffect(.degrees(degrees), axis: (x: 1, y: 1, z: 1)) }
        .onAppear() { withAnimation(.easeIn(duration: 0.9))
            {isAnimatingImage = true}  }
            VStack
            {Text(item.name)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.horizontal,5)
                    .scaledToFit()
                    .minimumScaleFactor(0.7)
            Text("$ \(item.price.format(f: ".2"))")
                    .fontWeight(.bold)
                    .foregroundColor(.white) }} }
    
            private func onAppearGesture() -> Void
    { if !onApp
        {withAnimation(.easeIn(duration: 0.2))
        { onApp = true}
        DispatchQueue.main.asyncAfter(deadline: .now() + 2)
        {withAnimation(.easeOut(duration: 0.2))
            { onApp = false}
                    } } }   }
