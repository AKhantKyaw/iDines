//
//  ItemRow.swift
//  iDine
//
//  Created by Aung Khant Kyaw on 21/06/2023.
//

import SwiftUI

struct ItemRow: View {
    let item :MenuItem
    let colors : [String : Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]
    var body: some View {
        HStack {
            Image(item.thumbnailImage)
                .clipShape(Circle())
                .overlay(Circle().stroke(.gray, lineWidth: 2))
            VStack (alignment: .leading){
                Text(item.name)
                    .font(.headline)
                HStack{
                    Text("$\(item.price)")
                    Spacer()
                    ForEach(item.restrictions, id: \.self) { restriction in
                        Text(restriction)
                            .font(.caption)
                            .fontWeight(.black)
                            .padding(5)
                            .background(colors[restriction, default: .black])
                            .clipShape(Circle())
                            .foregroundStyle(.white)
                    }
                }
            }
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
