//
//  TransferView.swift
//  NeoBanco
//
//  Created by MACBOOK on 23/06/24.
//

import SwiftUI

struct TransferView: View {
    @ObservedObject var viewModel: BankViewModel
    @State private var amount: String = ""

    var body: some View {
        VStack {
            TextField("Monto", text: $amount)
                .keyboardType(.decimalPad)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button(action: {
                if let amount = Double(amount) {
                    viewModel.makeTransfer(amount: amount)
                }
            }) {
                Text("Transferir")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
        }
        .navigationTitle("Transferencia")
    }
}
