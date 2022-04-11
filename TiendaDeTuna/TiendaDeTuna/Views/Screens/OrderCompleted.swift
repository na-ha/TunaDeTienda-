import SwiftUI
struct OrderCompleted: View {
    @State var isAnimatingImage: Bool = false

    var animation: Animation {
        Animation.easeOut}
    
  var body: some View {
      VStack
      {Text("Tienda de Tuna")
              .foregroundColor(.blue)
              .font(.title)
                .fontWeight(.heavy)
                .padding(.horizontal,50)
                .padding(.bottom,30)
                .padding(.top,30)
          Image("salmon2")
              .resizable()
                .aspectRatio(contentMode: .fit)
                  .frame(width: 90, height: 90)
                  .shadow(color: .black, radius: 10, x: 5, y: 5)
                  .scaleEffect(isAnimatingImage ? 2.2 : 0.1)
                  .onAppear()
          { withAnimation(.easeOut(duration: 0.9).repeatCount(3, autoreverses: true)) {
                          isAnimatingImage = true}}
                  .padding()
                  .padding(.bottom,30)
          Text("Su pedido ha sido enviado. ¡Nos pondremos en contacto contigo en breve!")
              .foregroundColor(.blue)
                .fontWeight(.heavy)
                .padding(.horizontal,50)
          Spacer() }
     .navigationBarTitle("🍣 ¡pedido completado!", displayMode: .inline)}}

struct OrderCompleted_Previews: PreviewProvider {
    static var previews: some View {
        OrderCompleted()
    }}
