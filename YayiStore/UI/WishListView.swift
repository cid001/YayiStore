//
//  WishListView.swift
//  YayiStore
//
//  Created by Yair Cid on 27/02/23.
//

import SwiftUI
private enum Constants {
    static let removedMessage = "Product removed from the wishlist!"
    static let removedLabel = "Remove"
}

struct WishListView: View {
    let columns = [GridItem(spacing: 0.0)]
    @Binding var wishlistProducts: [Product]
    @Binding var alertToggle: Bool
    @Binding var alertMessage: String
    
    var body: some View {
        VStack {
//            ScrollView {
                
                List(wishlistProducts) { product in
                    WishlistItemView(product: product)
                        .swipeActions {
                            Button {
                                alertToggle = true
                                alertMessage = Constants.removedMessage
                                wishlistProducts.removeAll(where: { $0.id == product.id })
                            } label: {
                                Text(Constants.removedLabel)
                            }
                            .tint(.red)
                        }
                }
                
        }
        .navigationTitle("Wishlist")
    }
}

struct WishListView_Previews: PreviewProvider {
    static var previews: some View {
        WishListView(wishlistProducts: .constant(productList),
                     alertToggle: .constant(true),
                     alertMessage: .constant(""))
            .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
            .previewDisplayName("iPhone 13 Pro Max")
        
        WishListView(wishlistProducts: .constant(productList),
                     alertToggle: .constant(true),
                     alertMessage: .constant(""))
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
            .previewDisplayName("iPhone SE (3rd generation)")
    }
}
