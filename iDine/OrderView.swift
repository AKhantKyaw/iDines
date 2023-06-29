//
//  OrderView.swift
//  iDine
//
//  Created by Aung Khant Kyaw on 24/06/2023.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order : Order
    func deleteItem (at offsets : IndexSet){
        order.items.remove(atOffsets: offsets)
        
    }
    var body: some View {
        NavigationStack{
            List{
                Section{
                    ForEach(order.items){item in
                        HStack{
                            Text(item.name)
                            Text("$ \(item.price)")
                            Spacer()
                        }
                    }
                    .onDelete(perform:deleteItem)
                    
                }
                Section{
                    NavigationLink("Place Order"){
                        Checkout()
                        
                    }
                    .navigationTitle("Order")
                    .toolbar{
                        EditButton()
                    }
                    
                }
                .disabled(order.items.isEmpty)
            }
        }
      
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView().environmentObject(Order())
    }
}
