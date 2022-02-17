

import SwiftUI

struct HomeView: View {
    @StateObject var HomeModel = OrderViewModel()

    @EnvironmentObject var order: OrderViewModel
    var items: [TunaModel]

    var body: some View {

        NavigationView{
            ZStack {
            GridView( items:items)
                
          
            HStack {
                MenuView()
                    .offset(x: HomeModel.showMenu ? 0 : -UIScreen.main.bounds.width / 1.6)
                
                Spacer(minLength: 0)
            }
            .background(
                Color.black.opacity(HomeModel.showMenu ? 0.3 : 0).ignoresSafeArea()
                // Closes when tab is out
                    .onTapGesture(perform: {
                        withAnimation(.easeIn){HomeModel.showMenu.toggle()}
                    })
            )
      
                
                
                
   
            
            
            
           
                       
        }
            
//            .navigationBarTitleDisplayMode(.large)
            .navigationBarItems(
 
                trailing:
                 Button(action: {
                withAnimation(.easeIn){HomeModel.showMenu.toggle()}
            }, label: {
                Image(systemName: "line.horizontal.3")
                    .font(.title)
                    .foregroundColor(Color.yellow)
            }))
        }

    }
    
}

struct TrailingBarItem: View {
    @ObservedObject var homeData: OrderViewModel


    var body: some View {
        NavigationLink(destination: OrderView()){
            Image(systemName:"cart")

    }
    }}
