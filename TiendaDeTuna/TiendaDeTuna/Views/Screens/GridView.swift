import SwiftUI
import UIKit
import Foundation

struct GridView: View {
    @StateObject var gridViewModel = GridViewModel()
    @StateObject var modelData = ModelData()
    @StateObject var HomeModel = OrderViewModel()
    @EnvironmentObject var order: OrderViewModel
    @ObservedObject var navigationManager = NavigationManager.shared
    @State var showModal: Bool = false
    @State private var degrees: Double = 0

  var items: [TunaModel]
  var totalQuantity: Int {
    var quantity = 0
    for item in order.items {quantity += item.quantity}
    return quantity }
  var body: some View {
    NavigationView {
      ZStack {
        NavigationLink(
          destination: self.navigationManager.dest, isActive: self.$navigationManager.isActive) {EmptyView()}
        ScrollView
          {LazyVGrid(columns: gridViewModel.columns, spacing: 2) {
            ForEach(modelData.menu) { item in
              TunaitemGridViewHelper(item: item)
                .onTapGesture {
                  gridViewModel.selectedModel = item
                }}  }}
        HStack
          {MenuView()
            .offset(x: HomeModel.showMenu ? 0 : -UIScreen.main.bounds.width / 1.6)
          Spacer(minLength: 0)}
        .background(
          Color.black.opacity(HomeModel.showMenu ? 0.3 : 0).ignoresSafeArea()
            // Closes when tab is out
            .onTapGesture(perform: {
              withAnimation(.easeIn) { HomeModel.showMenu.toggle() }
            })) }
      .background(Color.blue)
      .navigationBarItems(
        trailing:
          Button(
            action: {
              withAnimation(.easeIn) { HomeModel.showMenu.toggle() } },
            label: {
              ZStack {
                if totalQuantity == 0 {
                  Button(
                    action: {
                      withAnimation(.easeIn) { HomeModel.showMenu.toggle() } },
                    label: {
                      Image(systemName: "line.horizontal.3")
                        .font(.title)
                        .foregroundColor(Color.blue) }) }
                  else
                  { Image(systemName: "cart")
                    .font(.system(size: 27))
                  ZStack {
                    Circle()
                      .fill(Color.blue)
                      .frame(maxWidth: 20)
                    Text("\(totalQuantity)")
                      .fontWeight(.bold)
                      .font(.custom("Avenir", size: 12))
                      .foregroundColor(Color.white)}
                  .offset(x: 15, y: -10)
                  .opacity(totalQuantity > 0 ? 1.0 : 0)
                }}   }))
      .navigationBarTitle("🍣  tienda de tuna", displayMode: .inline) }
    .accentColor(.blue)
    .sheet(isPresented: $gridViewModel.showModal) {
      DetailView(
        showModal: $gridViewModel.showModal, isPresented: self.$showModal, item: gridViewModel.selectedModel!,
        shoppingCosmetic: gridViewModel.selectedModel!)
        .environmentObject(self.navigationManager)} }}

