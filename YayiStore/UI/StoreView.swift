//
//  StoreView.swift
//  YayiStore
//
//  Created by Yair Cid on 27/02/23.
//

import SwiftUI

struct StoreView: View {
    @Binding var wishlistProducts: [Product]
    
    var body: some View {
        let columns = [GridItem(spacing: 0.0),
                       GridItem(spacing: 0.0)]
        
        ScrollView {
            LazyVGrid (columns: columns) {
                ForEach(productList, id: \.id) { item in
                    ItemStoreView(product: item, wishlistProducts: $wishlistProducts)
                        .padding([.top, .trailing, .leading])                    
                }
            }
        }
    }
}

struct StoreViewPreview_Previews: PreviewProvider {
    static var previews: some View {
        StoreView(wishlistProducts: .constant(productList))
            .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
            .previewDisplayName("iPhone 13 Pro Max")
        
        StoreView(wishlistProducts: .constant(productList))
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
            .previewDisplayName("iPhone SE (3rd generation)")
    }
}

