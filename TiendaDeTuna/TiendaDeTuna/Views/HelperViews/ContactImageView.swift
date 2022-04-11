
import SwiftUI

struct ContactImageView: View {
    var body: some View {
        Image("contact-sushi")
            .opacity(0.4)
            .frame(width: 120, height: 120)
            .clipShape(Circle()
        
        
        
        ).overlay(Circle()
            
            .stroke(Color.white, lineWidth: 4)).shadow(radius: 10)
    }
}

struct ContactImageView_Previews: PreviewProvider {
    static var previews: some View {
        ContactImageView()
    }
}
