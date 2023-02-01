//
//  DBManager.swift
//  MAPD-724-SlotMachine
//
//  Created by Nirav Goswami on 2023-02-01.
//


import UIKit

import FirebaseCore
import FirebaseFirestore

class DBManager
{
    var db: Firestore!
    var global_data_collection = "global"
    var global_jackpot_key = "global_jackpot"
    var user_data_collection = "users"
    let userId = UIDevice.current.identifierForVendor?.uuidString
    init()
    {
        db = Firestore.firestore()
    }
    
    public func getUserHighestPayout(completion:@escaping (_ highestPaidAmount: Int?)->())
    {
        // Get user's highest payot amount on app startup
        var highestPaidAmount = 0
        db.collection(user_data_collection).document(userId!).getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data()
                highestPaidAmount = dataDescription!["highest_paid"] as? Int ?? 0
                completion(highestPaidAmount)
            } else {
                highestPaidAmount = 0
                completion(highestPaidAmount)
            }
        }
    }
    
    public func saveUserHighestPayout(amount: Int)
    {
        // Save user's highest payot amount
        db.collection(user_data_collection).document(userId!).setData([
            "highest_paid": amount
        ])  { err in
            if let err = err {
                print("saveUserHighestPayout Error adding document: \(err)")
            } else {
            }
        }
    }
    
    public func saveGlobalJackpotAmount(amount: Int)
    {
        // Set global jackpot data
        db.collection(global_data_collection).document(global_jackpot_key).setData([
            "amount": amount
        ]) { err in
            if let err = err {
                print("saveGlobalJackpotAmount Error adding document: \(err)")
            } else {
            }
        }
    }
    
    public func getGlobalJackpotAmount(completion:@escaping (_ globalJackpotAmount: Int?)->())
    {
       // Get realtime global jackpot data update
        var globalJackpotAmount = 0
       db.collection(global_data_collection).document(global_jackpot_key)
            .addSnapshotListener { documentSnapshot, error in
              guard let document = documentSnapshot else {
                  completion(globalJackpotAmount)
                  return
              }
              guard let data = document.data() else {
                  completion(globalJackpotAmount)
                  return
              }
                globalJackpotAmount = data["amount"] as? Int ?? 0
                completion(globalJackpotAmount)
            }
        
    }
    
    
}
