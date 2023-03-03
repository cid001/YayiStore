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
    static let navTitle = "Wishlist"
}

struct WishListView: View {
    let columns = [GridItem(spacing: 0.0)]
    @Binding var wishlistProducts: [Product]
    @Binding var alertToggle: Bool
    @Binding var alertMessage: String
    
    var body: some View {
        NavigationStack {
            VStack {
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
            .navigationBarStyle(title: Constants.navTitle, color: .orange)
        }
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

extension View {
    func navigationBarStyle(title: String, color: Color) -> some View {
        self.navigationTitle(title)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(color, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
    }
}
