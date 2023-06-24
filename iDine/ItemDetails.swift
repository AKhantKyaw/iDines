//
//  ItemDetails.swift
//  iDine
//
//  Created by Aung Khant Kyaw on 21/06/2023.
//

import SwiftUI

struct ItemDetails: View {
    let item : MenuItem
    var body: some View {
        VStack{
            Image(item.mainImage)
            Text(item.description)
        }
    }
}

struct ItemDetails_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetails(item: MenuItem.example)
    }
}
