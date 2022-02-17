

import SwiftUI

struct DetailView: View {


    
    
    @Binding var isShowingDetailView: Bool
    @State var quantity = 0

    var item: TunaModel
     @EnvironmentObject var order: OrderViewModel
    

    var body: some View {
      
VStack {
            DismissButton(isShowingModal: $isShowingDetailView)
          

            
            Spacer()
    VStack{

        TunaItemDetailViewHelper(item: item)
        Spacer()
        
        
    }}}}
                       
                       
                       
                       
                       

              
        
    

