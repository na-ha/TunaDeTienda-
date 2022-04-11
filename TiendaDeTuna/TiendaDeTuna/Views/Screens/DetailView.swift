import SwiftUI
struct DetailView: View {
    @ObservedObject var navigationManager = NavigationManager.shared
    @EnvironmentObject var order: OrderViewModel
    @State private var showAlert = false
    @State  var revealDetails = false
    @State private var isAnimatingImage: Bool = false
    @State var isAnimated : Bool = false
    @State var dest: AnyView? = nil
    @Binding var showModal: Bool
    @Binding var isPresented: Bool
    var item: TunaModel
    var shoppingCosmetic : TunaModel
    var animation: Animation {
        Animation.easeOut}
    
    var body: some View {
        ZStack {
            Color(UIColor(red:  CGFloat(Float(shoppingCosmetic.backgroundColorProduct[0])!/256), green:  CGFloat(Float(shoppingCosmetic.backgroundColorProduct[1])!/256), blue:  CGFloat(Float(shoppingCosmetic.backgroundColorProduct[2])!/256), alpha: 1))
            VStack {
                DismissButton(item: item, isShowingModal: $showModal, shoppingCosmetic: item)
                          ScrollView(.vertical, showsIndicators: true) {
                              VStack{
                                  VStack{
                    ZStack(alignment: .top)
                    {Color(UIColor(red:  CGFloat(Float(shoppingCosmetic.backgroundColorProduct[0])!/256), green:  CGFloat(Float(shoppingCosmetic.backgroundColorProduct[1])!/256), blue:  CGFloat(Float(shoppingCosmetic.backgroundColorProduct[2])!/256), alpha: 1))
                    VStack
                        {Text (item.headline)
                            .font(.headline)
                            .padding(.horizontal)
                            .foregroundColor(Color.black)
                        if revealDetails == false
                        { if showAlert == false
                            {Image(item.image)
                 .resizable()
                  .aspectRatio(contentMode: .fit)
                    .padding(.horizontal)
                    .scaleEffect(isAnimatingImage ? 1.2 : 0.3)
                      .shadow(color: .gray, radius: 10, x: 5, y: 5)
                      .frame(width:300, height: 300)
                        .onAppear()
                                {withAnimation(.easeOut(duration: 0.9))
                                    {isAnimatingImage = true} }}
                                if  showAlert == true
                            {Image(item.image)
                    .resizable()
                     .shadow(color: .gray, radius: 10, x: 5, y: 5)
                     .frame(width:200, height: 200)
                     .padding()
                     .rotationEffect(Angle(degrees: isAnimated ? 0 : (Double.random(in: 360...9020))))
                       .animation(animation)  }  }}}
                    GroupBox()
                    {DisclosureGroup("Ingredientes", isExpanded: $revealDetails)
                        {Spacer()
                            IngredientsLabel(shoppingCosmetic: shoppingCosmetic, item: item)
                        Text(item.description)
                            .font(.body)
                            .padding(.top,2) }
                    .accentColor(Color.blue)}
                    .overlay( RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.blue, lineWidth: 2))
                    .foregroundColor(Color.black)
                    .font(Font.system(.body).bold())
                   .padding(.horizontal)  } }
           if order.total > 0
                              { VStack
                                {  VStack
        {Button(action:
                        { self.dest = AnyView(OrderView())
                                if let dest = self.dest
                  {self.navigationManager.move(to: dest)
                    self.showModal = false }})
               {Image(systemName: "cart")
                 .foregroundColor(Color.blue)
                .rotationEffect(Angle(degrees: isAnimated ? 720 : 360 ))
               .animation(animation)
        Text("Ir a Caja")
             .font(.footnote)
             .foregroundColor(Color.blue) }
            .buttonStyle(BorderlessButtonStyle())
            .frame(width: 120, height: 41)
              .background(Color.white)
             .cornerRadius(20)   }}
             .overlay(RoundedRectangle(cornerRadius: 20)
                 .stroke(Color.blue, lineWidth: 3) )
                  .padding(.horizontal)
                  .padding(.top, 20.0)    } }
                   VStack
                {ForEach(Array(order.items.enumerated()),id: \.element){ index,order in
              if order.id == item.id
                        {Text("\(order.quantity) orden de \(order.name) rollos")
                   .fontWeight(.bold)} }
            HStack
         {Text("$\(item.price.description) por 4 Rollos")
                    .font(.headline)
                    .padding(.leading,4)
                    .foregroundColor(Color.blue)
                Stepper("",
                    onIncrement: {
                        order.add(item: item)
                print("stepper order \(item.name)")
                print("order \(order.total)")
                    self.showAlert = true},
                    onDecrement: {
                        order.remove(item: item)
                    self.showAlert = true   })
            .foregroundColor(Color.blue)}
            .background(Color.white)
            .cornerRadius(20)
            .overlay( RoundedRectangle(cornerRadius: 20)
            .stroke(Color.blue, lineWidth: 2))
            .padding(.horizontal,10) } }
            .padding()   }} }
