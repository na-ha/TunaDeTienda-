import SwiftUI
struct ContactInfo: View {
    @Binding var showModal : Bool
    var body: some View {
        VStack {
            HStack
            {Text ("contact informatie")
                    .font(.custom("GillSans", size: 40))
                    .foregroundColor(Color.white)
                    .padding(.trailing,25)
                    .padding(.leading,10)
                    .lineLimit(1)
                    .minimumScaleFactor(0.3)
            Button {showModal.toggle() } label: {Image(systemName: "xmark")
                    .imageScale(.large)
                    .foregroundColor(Color.blue)
                    .frame(width: 34, height: 34)
                    .background(Color.white)
                    .cornerRadius(20)
                    .overlay(Circle().stroke(Color.blue, lineWidth: 1))}
            .padding(.horizontal,25)
            .padding(.top,5)}
            MapsUIView().edgesIgnoringSafeArea(.top).frame(height: 150)
            ContactImageView().offset(y: -158).padding(.bottom, -130)
            VStack(spacing:0) {
                VStack (alignment: .leading)
                {Text("Tienda de Tuna")
                        .foregroundColor(.white)
                        .font(.custom("GillSans", size: 40)) }
                List{
                    VStack (alignment: .leading)
                    { HStack {
                        Text("Address")
                            Spacer()
                            .font(.subheadline)
                        Text("Cali, Colombia")}
                        .padding(.horizontal) }
                VStack{
                  HStack {
                        Text("Phone")
                            Spacer()
                            .font(.subheadline)
                        Text("+57 323-346-0230")}
                    .padding(.horizontal) }
                VStack{
                    HStack {
                        Text("E-mail")
                            Spacer()
                            .font(.subheadline)
                            .accentColor(.black)
                        Text("tuna@tuna.com")}
                    .padding(.horizontal)} }
                .background(Color.blue)
            VStack{
            HStack (spacing:54){
                Group{
                    Link(destination: URL(string: "https://www.simpleswiftguide.com")!) {
                        Image("facebook")
                            .resizable()
                            .scaledToFit()
                        .frame(width: 50, height: 50)}
                        Link(destination: URL(string: "https://www.simpleswiftguide.com")!) {
                            Image("instagram")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)}
                            Link(destination: URL(string: "https://www.simpleswiftguide.com")!) {
                                Image("twitter")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)}}
                         .padding(.top,20) }}
                .padding(.bottom,20)
                Spacer()
                HStack {
                    Text("Desarrollado por:")
                        .font(.subheadline)
                        .foregroundColor(.white)
                    Spacer()
                    Text("tuna@tuna.com")
                        .font(.subheadline)
                        .accentColor(.white)}
                .padding(.horizontal,50)}
            Spacer() }
        .background(Color.blue)}}
//struct ContactInfo_Previews: PreviewProvider {
//    @Binding var showModal : true
//
//    static var previews: some View {
//        ContactInfo(showModal: $showModal)
//    }
//}
