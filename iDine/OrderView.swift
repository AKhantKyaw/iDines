//
//  OrderView.swift
//  iDine
//
//  Created by Aung Khant Kyaw on 24/06/2023.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order : Order
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
                    
                }
                Section{
                    NavigationLink("Place Order"){
                        Text("Check Out")
                        
                    }
                    .navigationTitle("Order")
                }
                
            }
        }
      
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView().environmentObject(Order())
    }
}
