import SwiftUI
import MapKit
struct MapsUIView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView
    {MKMapView(frame: .zero)}
    
    func updateUIView(_  view: MKMapView, context: Context){
        let coordinate = CLLocationCoordinate2D(
            latitude: 3.359889, longitude: -76.638565)
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true) }}

struct MapsUIView_Previews: PreviewProvider {
    static var previews: some View {
        MapsUIView()
    }}
