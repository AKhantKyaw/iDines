//
//  Checkout.swift
//  iDine
//
//  Created by Aung Khant Kyaw on 28/06/2023.
//

import SwiftUI

struct Checkout: View {
    @EnvironmentObject var  order : Order
    @State private var  paymentType = "Cash"
    let paymentTypes = ["Cash","Credit Card", "iDine Points"]
    //lotalDetails toogle
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    
    @State private var tipAmount = 15
    @State private var showPaymentAlert = false;
    
    let tipAmounts = [10, 15, 20, 25, 0]
    var totalPrice: String {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)
        return (total + tipValue).formatted(.currency(code: "USD"))
    }
    var body: some View {
        Form{
            Section{
                Picker("How do you want to pay?", selection: $paymentType){
                    ForEach(paymentTypes,id: \.self){
                        Text($0)
                    }
                }
                Toggle("Add iDine loyalty card", isOn: $addLoyaltyDetails.animation())
                if addLoyaltyDetails{
                    TextField("Enter your iDine ID", text: $loyaltyNumber)
                }
            }
            Section("Add a tip?") {
                Picker("Percentage:", selection: $tipAmount) {
                    ForEach(tipAmounts, id: \.self) {
                        Text("\($0)%")
                    }
                }
                .pickerStyle(.segmented)
            }
            Section("Total : \(totalPrice)"){
                Button("Order Comfirm"){
                    showPaymentAlert.toggle()
                }
                .buttonStyle(.bordered)
                .foregroundColor(.red)
            }
            .alert("Order confirmed", isPresented:$showPaymentAlert){
                
            } message: {
            Text("Your total was \(totalPrice) – thank you!")
        }
        }
       
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Checkout_Previews: PreviewProvider {
    static var previews: some View {
        Checkout().environmentObject(Order())
    }
}
