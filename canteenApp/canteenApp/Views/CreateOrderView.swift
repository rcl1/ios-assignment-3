import SwiftUI

struct CreateOrderView: View {
    @State var StudentName = ""
    @State var totalPrice = 0.0
    @State var items = [String]()
    @State var showFoodList = false
    @EnvironmentObject var itemViewModel:ItemViewModel
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack{
            HStack{
                Text("New Order")
                    .font(.largeTitle)
                Spacer()
            }
            Form{
                Section("STUDENT"){
                    HStack{
                        Text("Name:")
                        Spacer()
                        TextField("Enter student name", text: $StudentName)
                    }
                } // END SECTION1
                Section("ITEMS"){
                    VStack{
                        Button(action: {showFoodList = true} ){
                            Text("Add Item to Order")
                        }
                        List(items, id:\.self){foodItemName in
                            if let thisItem = itemViewModel.FoodItems.first(where: {$0.name == foodItemName}){
                                HStack{
                                    Text(thisItem.name)
                                    Spacer()
                                    Text(String(format:"$%.2f", thisItem.price))
                                }
                            } else {
                                Text("Item not found")
                            }
                        }

                        Divider()
                        HStack{
                            Text("Total:")
                            Spacer()
                            Text(String(format:"$%.2f", totalPrice))
                        }.font(.headline)
                    }
                } // END SECTION2
                Button(action: {
                    // Submit the order to Firestore
                    itemViewModel.addOrder(StudentName: StudentName, items: items, totalPrice: String(totalPrice))

                    // Dismiss the current view
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Place Order")
                } // END BUTTON
            } // END FORM
        } // END VSTACK
        .padding()
        .sheet(isPresented: $showFoodList, content: {OrderFoodList(items: $items, totalPrice: $totalPrice) })
    }
}


// same as FoodListView, but OrderFoodList is for orders
struct OrderFoodList: View {

    @Binding var items:[String]
    @Binding var totalPrice:Double
    @EnvironmentObject var itemViewModel:ItemViewModel
    @Environment(\.presentationMode) var presentationModeHere

    var body: some View {
        NavigationView {
            List {
                ForEach(foodCategories, id:\.self){ categoryName in
                    Section(categoryName){
                        ForEach(itemViewModel.FoodItems){foodItem in
                            if foodItem.category == categoryName {
                                
                                // Button separate view
                                foodItemButton(item: foodItem, items: $items, totalPrice: $totalPrice, presentationModeHere: presentationModeHere)

                            }
                        }
                    }
                }
            }
            .navigationTitle("Menu")
        }
    }
}

struct foodItemButton: View{
    @State var item:FoodItem
    @Binding var items:[String]
    @Binding var totalPrice:Double
    @Binding var presentationModeHere:PresentationMode

    var body: some View {
        Button(action: {
            // Add the items selected to the items list
            items.append(item.name)
            // Update the total price
            totalPrice += item.price
            // Go back to the order summary view
            $presentationModeHere.wrappedValue.dismiss()
        }) {
            HStack{
                Text(item.name)
                Spacer()
                Text(String(format:"$%.2f", item.price))
            }
        }
    }
}
