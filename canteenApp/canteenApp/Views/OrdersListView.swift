//
//  OrdersListView.swift
//  canteenApp
//
//  Created by Thanh Nguyen Trong on 07/09/2022.
//

import SwiftUI

struct OrdersListView: View {
    @EnvironmentObject var itemViewModel: ItemViewModel

    @State var showCreateOrderView = false

    var body: some View {
        NavigationView{
            List{
                if itemViewModel.Orders.count > 0 {
                    ForEach(itemViewModel.Orders){ thisOrder in
                        Section(thisOrder.StudentName){
                            // Contains 1 VStack, 2 HStacks
                            VStack{
                                ForEach(thisOrder.items, id:\.self){foodItemName in
                                    if let thisItem = itemViewModel.FoodItems.first(where: {$0.name == foodItemName}) {
                                        HStack{
                                            Text(thisItem.name)
                                            Spacer()
                                            Text(String(format:"$%.2f", thisItem.price))
                                        }
                                    } else {
                                        Text("Item not found")
                                    }
                                }
                            } // VStack

                            HStack{
                                Text("Total:")
                                Spacer()
                                Text(String(format:"$%.2f", thisOrder.totalPrice))
                            }

                            HStack{
                                Spacer()
                                Button(action: {
                                    // Delete the order
                                    itemViewModel.deleteOrder(thisOrder)
                                }, label: {
                                    Text("Delete Order")
                                })
                                Spacer()

                            }

                        } // Section

                    }
                } else {
                    // No orders
                    Text("No orders yet")
                }
            }
            .navigationTitle("Orders")
            .navigationBarItems(trailing: Button(action: {showCreateOrderView = true}){Text("Create Order")})
        } // NavigationView
        .sheet(isPresented: $showCreateOrderView, content: {
            CreateOrderView()
        })
    }
}

struct OrdersListView_Previews: PreviewProvider {
    static var previews: some View {
        OrdersListView()
    }
}
