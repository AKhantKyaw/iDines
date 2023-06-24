//
//  ItemDetails.swift
//  iDine
//
//  Created by Aung Khant Kyaw on 21/06/2023.
//

import SwiftUI

struct ItemDetails: View {
    let item : MenuItem
    @EnvironmentObject var order : Order
    var body: some View {
        VStack{
            ZStack(alignment: .bottomTrailing){
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                Text("Photo: \(item.photoCredit)")
                .padding(4)
                .background(.black)
                .font(.caption)
                .foregroundStyle(.white)
                .offset(x: -5, y: -5)
            }
            Text(item.description)
            Button("Order this"){
                order.add(item: item)
                
            }.buttonStyle(.borderedProminent)
            Spacer()
        }
        .navigationTitle(item.name)
    }
}

struct ItemDetails_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            ItemDetails(item: MenuItem.example)
        }
    }
}
