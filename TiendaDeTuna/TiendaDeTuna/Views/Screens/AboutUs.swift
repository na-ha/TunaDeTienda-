import SwiftUI

struct AboutUs: View {

    @State private var showModal = false

    var body: some View
    { VStack(spacing: 20)
        {Text("¡Bienvenido a Tienda de Tuna - Cali!")
        .font(.custom("GillSans", size: 30))
        .foregroundColor(.white)
        .multilineTextAlignment(.center)
        .padding(.horizontal)
            Video(url: Bundle.main.path(forResource: "video", ofType: "mp4")!)
              .cornerRadius(10)
              .frame(maxHeight: 250)
            ScrollView
            {Image("tuna2")
                    .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxHeight: 50)
            Text("Tienda de Tuna ofrece una deliciosa degustación de cocina japonesa en Cali, Colombia. El conveniente servicio de Tienda de Tuna y los precios asequibles nos convierten en una opción natural. Somos conocidos por la variedad en el sabor y el sushi fresco de alta calidad.")
                .font(.caption)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .lineSpacing(5)
            Spacer()
                Button(action:
                        {self.showModal.toggle()
                    print("contact view tapped")  }) {Text("pedido")
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.blue)
                    .padding()
                                   .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(15)}
                .padding(.horizontal,10) }}
        .background(Color.blue)
        .navigationBarTitle("🍣 sobre nosotros", displayMode: .inline)
        .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20))
        .background(Color.blue)
        
  .sheet(isPresented: $showModal, onDismiss: {print(self.showModal) }) {ContactInfo(showModal: $showModal)}
    } }
    

struct PageContentView_Previews: PreviewProvider {
    static var previews: some View {
        AboutUs()
    }
}
