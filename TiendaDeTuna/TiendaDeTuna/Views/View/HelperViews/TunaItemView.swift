

import SwiftUI

struct TunaitemGridViewHelper: View {
    let item: TunaModel

    
    
    var body: some View{
        VStack{
           Image(item.image)
    .resizable()
      .aspectRatio(contentMode: .fit)
        .frame(width: 90, height: 90)
            VStack{
            Text(item.name)
                    .scaledToFit()

                    .minimumScaleFactor(0.8)

            Text("$ \(item.price.format(f: ".2"))")
            }

            .scaledToFit()
            .minimumScaleFactor(0.8)
            .foregroundColor(Color.white)
            
        }
        .padding()
    }
}
