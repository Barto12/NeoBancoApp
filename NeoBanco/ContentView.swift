//
//  ContentView.swift
//  NeoBanco
//
//  Created by MACBOOK on 23/06/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = BankViewModel(user: User(name: "Juan Perez", balance: 1000))

    var body: some View {
        NavigationView {
            VStack {
                Text("Bienvenido, \(viewModel.user.name)")
                    .font(.largeTitle)
                    .padding()

                Text("Saldo: \(viewModel.checkBalance(), specifier: "%.2f") €")
                    .font(.title)
                    .padding()

                if let card = viewModel.user.creditCard {
                    Text("Tarjeta de Crédito: \(card.number)")
                        .padding()
                } else {
                    Button(action: {
                        viewModel.requestCreditCard()
                    }) {
                        Text("Solicitar Tarjeta de Crédito")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding()
                }

                NavigationLink(destination: TransferView(viewModel: viewModel)) {
                    Text("Realizar Transferencia")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
            }
            .navigationTitle("Neobanco")
        }
    }
}
