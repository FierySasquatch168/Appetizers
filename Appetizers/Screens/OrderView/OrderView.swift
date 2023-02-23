//
//  OrderView.swift
//  Appetizers
//
//  Created by Aleksandr Eliseev on 21.02.2023.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: order.deleteItems)
                    }
                    .listStyle(PlainListStyle())
                    
                    Button {
                        print("order please")
                    }label: {
//                        APButton(title: "$\(order.totalPrice, specifier: "%.2f") - Place order")
                        Text("$\(order.totalPrice, specifier: "%.2f") - Place order")
                    }
                    .modifier(StandartButtonStyle())
                    .padding(.bottom, 25)
                }
                
                if order.items.isEmpty {
                    EmptyState(imageName: "empty-order", message: "You have no items in your order, please add something")
                }
            }
            .navigationTitle("Orders")
        }
    }    
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
