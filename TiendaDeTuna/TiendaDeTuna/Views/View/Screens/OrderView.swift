

import SwiftUI

struct OrderView: View {

    @EnvironmentObject var order: OrderViewModel

    var body: some View {
        NavigationView{
            List{
                Section{
                    ForEach(order.items){ order in
                        HStack{
                            Image(order.image)
                                .resizable()
                                  .aspectRatio(contentMode: .fit)
                                    .frame(width: 90, height: 90)
                            Text(order.name)
                            Spacer()
                            Text("$\(order.price)")

                            VStack{
                                Text("\(order.quantity) rolls")
                                    .fontWeight(.bold)
                            Stepper("",onIncrement: {
                                        self.order.add(item: order)
                                    },
                                    onDecrement: {
                                        self.order.remove(item: order)
                                    })}}
                    }.onDelete(perform: deleteItems)
                }
                

            }.navigationTitle("Order").listStyle(GroupedListStyle())
            .navigationBarItems(trailing: EditButton().foregroundColor(.green))
        }}
    
    func deleteItems(at offsets: IndexSet){
        order.items.remove(atOffsets: offsets)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}




