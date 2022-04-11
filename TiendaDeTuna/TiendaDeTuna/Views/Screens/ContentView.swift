
import Firebase
import SwiftUI

struct ContentView: View {
  @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false

  var order = OrderViewModel()
  var items = [TunaModel]()

  var body: some View {
    VStack
      {if status
        { GridView(items: items)
          .environmentObject(order)}
        else {NavigationView
            {FirstPage()}} }
    .onAppear
      { NotificationCenter.default.addObserver(
        forName: NSNotification.Name("statusChange"), object: nil, queue: .main)
          { (_) in
        let status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
        self.status = status }}  }}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }}

struct FirstPage: View {
  @State var ccode = "1"
  @State var no = ""
  @State var show = false
  @State var msg = ""
  @State var alert = false
  @State var ID = ""

  var body: some View {
    ZStack {
      LaunchView()
      VStack(spacing: 20) {
        Image("pic")
        Text("Verify Your Number").font(.largeTitle).fontWeight(.heavy)
          .foregroundColor(Color.blue)
        Text("Ingrese su número para verificar su cuenta")
          .font(.body)
          .foregroundColor(.black)
          .padding(.top, 12)
        HStack
          {CustomTextField(
            placeholder: Text("+57").foregroundColor(.white),
            text: $ccode )
          .foregroundColor(.white)
        .keyboardType(.numberPad)
          .frame(width: 45)
          .padding()
          .background(Color.blue.opacity(0.7))
          .clipShape(RoundedRectangle(cornerRadius: 10))
          CustomTextField(
            placeholder: Text("Número").foregroundColor(.white),text: $no)
          .foregroundColor(Color.white)
            .keyboardType(.numberPad)
            .padding()
            .background(Color.blue.opacity(0.7))
            .clipShape(RoundedRectangle(cornerRadius: 10)) }
            .padding(.top, 15)
            .padding(.horizontal, 40)
        NavigationLink(destination: ScndPage(show: $show, ID: $ID), isActive: $show) {
          Button(action: {
            PhoneAuthProvider.provider().verifyPhoneNumber(
              "+" + self.ccode + self.no, uiDelegate: nil )
              { (ID, err) in
              if err != nil
                {self.msg = (err?.localizedDescription)!
                self.alert.toggle()
                return }
              self.ID = ID!
              self.show.toggle()  }})
            {Text("Send").frame(width: UIScreen.main.bounds.width - 70, height: 50)}
          .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(10)
            .padding()}
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true) }
      .background(Color.white.opacity(0.5))
      .cornerRadius(20)
      .padding(.horizontal, 550)
      .padding()
      .alert(isPresented: $alert)
        {Alert(title: Text("Error"), message: Text(self.msg), dismissButton: .default(Text("Ok")))}} }}

struct ScndPage: View {
  @State var code = ""
  @Binding var show: Bool
  @Binding var ID: String
  @State var msg = ""
  @State var alert = false
  var body: some View {
    ZStack(alignment: .topLeading) {
      GeometryReader { _ in
        VStack(spacing: 20) {
          Image("pic")
          Text("Verification Code").font(.largeTitle).fontWeight(.heavy)
          Text("Please Enter The Verification Code")
            .font(.body)
            .foregroundColor(Color.blue)
            .padding(.top, 12)
          TextField("Code", text: self.$code)
            .keyboardType(.numberPad)
            .padding()
            .background(Color("Color"))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.top, 15)
          Button(action: {
            let credential = PhoneAuthProvider.provider().credential(
              withVerificationID: self.ID, verificationCode: self.code)
            Auth.auth().signIn(with: credential) { (res, err) in
              if err != nil {
                self.msg = (err?.localizedDescription)!
                self.alert.toggle()
                return   }
              UserDefaults.standard.set(true, forKey: "status")
              NotificationCenter.default.post(
                name: NSNotification.Name("statusChange"), object: nil) }})
            {Text("Verify").frame(width: UIScreen.main.bounds.width - 30, height: 50)}
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(10)
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)  }}
      Button(action: {
        self.show.toggle() })
        { Image(systemName: "chevron.left").font(.title) }
    .foregroundColor(.blue)}
    .padding()
    .alert(isPresented: $alert)
      { Alert(title: Text("Error"), message: Text(self.msg), dismissButton: .default(Text("Ok")))
    }}}

struct CustomTextField: View {
  var placeholder: Text
  @Binding var text: String
  var editingChanged: (Bool) -> Void = { _ in }
  var commit: () -> Void = {}
  var body: some View {
    ZStack(alignment: .leading) {
      if text.isEmpty { placeholder }
      TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
    }}}
