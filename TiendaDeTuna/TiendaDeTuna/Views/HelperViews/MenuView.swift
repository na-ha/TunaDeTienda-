import SwiftUI
import Firebase

struct MenuView: View {

    var body: some View {
        VStack {
            VStack
            {NavigationLink(destination: AboutUs())
                {HStack(spacing: 15)
                    {Image(systemName: "person.3.sequence.fill")
                        .font(.title)
                        .foregroundColor(Color.blue)
                    Text("sobre nosotros")
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                    Spacer(minLength: 0) }}}
                        .padding()
                VStack
            { NavigationLink(destination: OrderView())
                {HStack(spacing: 15)
                    { Image(systemName: "cart")
                            .font(.title)
                            .foregroundColor(Color.blue)
                        Text("  carro")
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                        Spacer(minLength: 0)  }}}
                    .padding()
            VStack
            { HStack(spacing: 15)
                {  Button(action:
                { try! Auth.auth().signOut()
                        UserDefaults.standard.set(false, forKey: "status")
                        NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil) })
                    {Image(systemName: "person.crop.circle.fill.badge.xmark")
                            .font(.title)
                            .foregroundColor(Color.blue)
                        Text("  cerrar sesión")
                            .fontWeight(.bold)
                            .foregroundColor(.blue)}
                  Spacer(minLength: 0)}}
                .padding()
                        Spacer()
            HStack
            {Spacer()
                Text("tienda de tuna 1.0")
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)}
            .padding(10) }
        .padding([.top, .trailing])
        .frame(width: UIScreen.main.bounds.width / 1.6)
        .background(Color.white.ignoresSafeArea()) }}
