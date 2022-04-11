import SwiftUI
struct OrderView: View {
  @EnvironmentObject var order: OrderViewModel
  @ObservedObject var navigationManager = NavigationManager.shared
  @State var showModal: Bool = false
  @State var isAnimated: Bool = true
  var animation: Animation {
    Animation.easeOut }
    @State var isEditMode: EditMode = .inactive
  var body: some View {
    List {
      Section {
        ForEach(order.items) { item in
          HStack {
            VStack {
              Spacer()
              Text("\(item.name) rollos")
                .fontWeight(.heavy)
                .foregroundColor(.blue)
                .frame(width: 100)
                .minimumScaleFactor(0.5)
                .lineLimit(2)
              Image(item.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 90, height: 90)
                .cornerRadius(12)
                .shadow(color: .black, radius: 10, x: 5, y: 5)}
            Spacer()
            VStack
              {Text(item.headline)
                .frame(width: 135, height: 100)
                .scaledToFit()
                .minimumScaleFactor(0.6)}
            Spacer()
            VStack {
              Text("$ \(item.price.format(f: ".2"))")
                .fontWeight(.heavy)
                .foregroundColor(.blue)}}
          HStack {
              if item.quantity > 1 {
                Text("\(item.quantity) Rollos")
                  .fontWeight(.bold)
                  .padding(.leading, 10)}
              if item.quantity == 1 {
                Text("\(item.quantity) Rollo")
                  .fontWeight(.bold) }
              Spacer()
              Stepper("",
                onIncrement:
                    {self.order.add(item: item)
                  print("order total $\(order.total)") },
                onDecrement:
                    { self.order.remove(item: item) }) }
          .deleteDisabled(true)}
        .onDelete(perform: deleteItems)
        VStack {
          VStack {
            HStack {
              if order.total == 0.00 {
                VStack {
                  Spacer()
                  Image(systemName: "cart")
                    .font(.title)
                    .rotationEffect(Angle(degrees: isAnimated ? 180 : 180))
                    .animation(animation)
                    .padding(.top, 130)
                  Text("Your cart is empty...")
                    .font(.headline)
                    .fontWeight(.heavy)
                    .padding()
                    .padding(.bottom, 40)}
                .padding()}} }
          HStack
            {  Text("Total")
              .font(.title)
              .fontWeight(.heavy)
              .foregroundColor(.blue)
            Spacer()
            Text(" $\(order.total.format(f: ".2"))")
              .font(.title)
              .fontWeight(.heavy)
              .foregroundColor(.blue)} }
        VStack {
          HStack
            {if order.total > 0.00 {
              VStack {
                Spacer()
                HStack {
                  Spacer()
                  Button(action: { self.showModal.toggle() }) {
                    Text("pedido")
                      .font(.title2)
                      .fontWeight(.heavy)
                      .foregroundColor(.white)
                      .padding()
                      .frame(maxWidth: .infinity)
                      .background(Color.blue)
                      .cornerRadius(15) }
                  .padding(.horizontal,10)} } } } }} }
          .navigationBarTitle("🍣 carro", displayMode: .inline)
       .navigationBarItems(trailing:
            Group
                 { if isEditMode == .inactive
           { Button("Editar")
                     { withAnimation
                         {isEditMode = .active}  }
                        .padding(.all, 5)}
           else
           { Button("Terminar")
               {withAnimation
                   {isEditMode = .inactive } }
                .foregroundColor(.blue)
                .padding(.all, 5)} }
                  .padding()  )
                  .environment(\.editMode, $isEditMode)
                 .sheet(isPresented: self.$showModal)
{CheckOutView(isPresented: self.$showModal).environmentObject(self.navigationManager)}}

  func deleteItems(at offsets: IndexSet) {
    order.items.remove(atOffsets: offsets)}}
