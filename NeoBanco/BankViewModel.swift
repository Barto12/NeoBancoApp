//
//  BankViewModel.swift
//  NeoBanco
//
//  Created by MACBOOK on 23/06/24.
//

import Combine
import Foundation

class BankViewModel: ObservableObject {
    @Published var user: User

    init(user: User) {
        self.user = user
    }

    func requestCreditCard() {
        // Lógica para solicitar una tarjeta de crédito
        let newCard = CreditCard(number: "1234 5678 9012 3456", expiryDate: "12/26", cvv: "123")
        user.creditCard = newCard
    }

    func checkBalance() -> Double {
        return user.balance
    }

    func makeTransfer(amount: Double) {
        // Lógica para realizar una transferencia
        if amount <= user.balance {
            user.balance -= amount
            _ = Transaction(amount: amount, date: Date(), description: "Transferencia")
            // Aquí se agregarían las transacciones a un historial
        }
    }
}
