

import SwiftUI

struct TunaItemDetailViewHelper: View {
    let item: TunaModel
    @EnvironmentObject var order: OrderViewModel
    
    
    var body: some View{

        VStack{
            VStack{
           Image(item.image)
      .aspectRatio(contentMode: .fit)
        .frame(width: 90, height: 90)
                .padding()}
            Spacer ()

            HStack{
            Text(item.name)
                .font(.custom("Apple Chancery", size: 25))
                .fontWeight(.bold)
                .foregroundColor(Color.blue)
            Stepper("",
                    onIncrement: {
                        order.add(item: item)
                print("stepper order \(item.name)")
                print("order \(order.total)")

                    },
                    onDecrement: {
                        order.remove(item: item)
                    })
                
                Spacer ()
                Spacer ()
            }
            .padding(5)


            Text(item.description)

            Spacer ()
               }
        .padding()
    }
}

