//
//  FoodListView.swift
//  canteenApp
//
//  Created by Thanh Nguyen Trong on 07/09/2022.
//

import SwiftUI

struct FoodListView: View {
    @EnvironmentObject var itemViewModel: ItemViewModel

    var body: some View {
        NavigationView {
            List {
                ForEach(foodCategories, id:\.self){ categoryName in
                    Section(categoryName){
                        ForEach(itemViewModel.FoodItems){foodItem in
                            if foodItem.category == categoryName {
                                HStack{
                                    Text(foodItem.name)
                                    Spacer()
                                    Text(String(format:"$%.2f", foodItem.price))
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Menu")
        }
    }
}
