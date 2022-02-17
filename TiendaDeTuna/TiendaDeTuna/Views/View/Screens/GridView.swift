

import SwiftUI

struct GridView: View {

    @StateObject var gridViewModel = GridViewModel()
   @StateObject var modelData = ModelData()
    @EnvironmentObject var order: OrderViewModel
    var items: [TunaModel]
    var body: some View {
        
            VStack {
            ScrollView{

                
                LazyVGrid(columns: gridViewModel.columns ,spacing: 2){
                    ForEach(modelData.menu) { item in
                        TunaitemGridViewHelper(item: item)
                            
                            .onTapGesture{
                                gridViewModel.selectedModel = item
                            } }  }
                
                
            }            .navigationTitle(" Tienda De Tuna")
            .sheet(isPresented: $gridViewModel.isShowingDetailView){
                DetailView(isShowingDetailView: $gridViewModel.isShowingDetailView, item: gridViewModel.selectedModel!)
            }}
            .background(Color.cyan)
        
           }}
