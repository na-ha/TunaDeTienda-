import SwiftUI
struct LaunchView: View {
  var body: some View {
    VStack {
      VStack(spacing: -20) {
        Image("tuna2")
          .resizable()
          .frame(width: 90, height: 90)
          .padding(.bottom, 0)
        Text("Tienda de Tuna")
          .font(.largeTitle).fontWeight(.heavy)
          .padding(.bottom, 25)
          .foregroundColor(Color.white)}
      GeometryReader { geometry in
        ZStack {
          Video(url: Bundle.main.path(forResource: "video", ofType: "mp4")!)
            .cornerRadius(10)
            .frame(
              width: geometry.size.width / 4.2,
              height: geometry.size.width / 2.6 )
            .position(
              x: geometry.size.width / 2,
              y: geometry.size.height / 2.0)
        }}}
    .background(
      Image("yellowfin2")
        .aspectRatio(contentMode: .fill))
        .background(Color.blue) }}

#if DEBUG
  struct LaunchView_Previews: PreviewProvider {static var previews: some View {
      LaunchView()
    } }
#endif

