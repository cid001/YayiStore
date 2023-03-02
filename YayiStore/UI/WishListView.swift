//
//  WishListView.swift
//  YayiStore
//
//  Created by Yair Cid on 27/02/23.
//

import SwiftUI

struct WishListView: View {
    let columns = [GridItem(spacing: 0.0)]
    @Binding var wishlistProducts: [Product]
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid (columns: columns) {
                    ForEach(wishlistProducts, id: \.id) { item in
                        WishlistItemView(product: item)
                            .padding([.top, .trailing, .leading])
                    }
                }
            }
        }
        .navigationTitle("Wishlist")
    }
}

struct WishListView_Previews: PreviewProvider {
    static var previews: some View {
        WishListView(wishlistProducts: .constant(productList))
            .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
            .previewDisplayName("iPhone 13 Pro Max")
        
        WishListView(wishlistProducts: .constant(productList))
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
            .previewDisplayName("iPhone SE (3rd generation)")
    }
}
