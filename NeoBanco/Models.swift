//
//  Models.swift
//  NeoBanco
//
//  Created by MACBOOK on 23/06/24.
//

import Foundation

struct User: Identifiable {
    var id = UUID()
    var name: String
    var balance: Double
    var creditCard: CreditCard?
}

struct CreditCard: Identifiable {
    var id = UUID()
    var number: String
    var expiryDate: String
    var cvv: String
}

struct Transaction: Identifiable {
    var id = UUID()
    var amount: Double
    var date: Date
    var description: String
}

