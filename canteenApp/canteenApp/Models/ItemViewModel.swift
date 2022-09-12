//
//  ItemViewModel.swift
//  canteenApp
//
//  Created by Thanh Nguyen Trong on 07/09/2022.
//

import Foundation
import Combine // doing asynchroneous tasks, at the same time
import FirebaseFirestore
import Firebase

class ItemViewModel:ObservableObject {

    init() {
        getFood()
        getOrders()
    }
    // MARK: - FoodItems
    @Published var FoodItems = [FoodItem]()
    
    // MARK: - getFood()
    func getFood() {
        // Get a reference to the database
        let db = Firestore.firestore()
        // Read the documents at a specific path
        db.collection("FoodItems").getDocuments{ snapShot, error in

            // Check for errors
            if error == nil {
                // No errors
                // Update the lost property in the main thread
                DispatchQueue.main.async {
                    self.FoodItems = snapShot!.documents.map {d in
                        // Create a food item for every document returned
                        return FoodItem(category: d["Category"] as? String ?? "Others",
                                        name: d["Name"] as? String ?? "Unknown", // Unknown means the item failed to load
                                        price: Double(d["Price"] as? String ?? "0.0")!, // Force unwraps since we know all data.price is a double
                                        inStock: Bool(d["InStock"] as? String ?? "false")!)
                    }
                }
            } else {
                // Handle the error
                print("ERROR: getFood() error")
                // print(error!.localizedDescription)
            }
        }
        
        
        
        
        // db.collection("food").getDocuments { (querySnapshot, error) in
        //     if let error = error {
        //         print("Error getting documents: \(error)")
        //     } else {
        //         // loop through the documents
        //         for document in querySnapshot!.documents {
        //             // convert the document to a FoodItem object
        //             let foodItem = FoodItem(id: document.documentID, data: document.data())
        //             // add the food item to the array
        //             self.FoodItems.append(foodItem)
        //         }
        //     }
        // }
    }


    // MARK: - Orders
    @Published var Orders = [Order]()
    
    // MARK: - getOrders()
    func getOrders() {
        // Get a reference to the database
        let db = Firestore.firestore()
        // Read the documents at a specific path
        db.collection("Orders").getDocuments{ snapShot, error in

            // Check for errors
            if error == nil {
                // No errors
                // Update the lost property in the main thread
                DispatchQueue.main.async {
                    self.Orders = snapShot!.documents.map {d in
                        // Create a food item for every document returned
                        return Order(id: d.documentID,
                                     StudentName: d["StudentName"] as? String ?? "Unknown",
                                     items: d["items"] as? [String] ?? [String](),
                                     totalPrice: Double(d["totalPrice"] as? String ?? "0.0")!)
                    }
                }
            } else {
                // Handle the error
                print("ERROR: getOrders() error")
                // print(error!.localizedDescription)
            }
        }

    }
    
    // MARK: - addOrder()
    func addOrder(StudentName:String, items:[String], totalPrice:String) {
        // Get a reference to the database
        let db = Firestore.firestore()
        // Add a document to the collection
        db.collection("Orders").addDocument(data: [
            "StudentName": StudentName,
            "items": items,
            "totalPrice": totalPrice
        ]) { error in
            // if let error = error {
            //     print("Error adding document: \(error)")
            // } else {
            //     print("Document added")
            // }
            if error == nil{
                // No errors
                self.getOrders()
            } else {
                // Handle the error
                print("ERROR: getOrders() error")
            }
        }
    }
    
    // MARK: - deleteOrder()
    func deleteOrder(_ orderToDelete:Order){
        // Get a reference to the database
        let db = Firestore.firestore()
        // Delete the document at a specific path
        db.collection("Orders").document(orderToDelete.id).delete { error in
            if error == nil{
                // No errors
                DispatchQueue.main.async {
                    self.Orders.removeAll{ order in
                        // check for the order to delete
                        return order.id == orderToDelete.id
                    }
                }
            } else {
                // Handle the error
                print("ERROR: deleteOrder() error")
            }
        }
    }
}
