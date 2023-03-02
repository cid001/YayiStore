//
//  TabView.swift
//  YayiStore
//
//  Created by Yair Cid on 27/02/23.
//

private enum Constants {
    static let storeLabel = "Store"
    static let wishListLabel = "Wish List"
    static let profileLabel = "Profile"
    static let storeImage = "bag.fill"
    static let wishListImage = "heart.fill"
    static let profileImage = "person.crop.circle.fill"
}

import SwiftUI

struct StoreTabView: View {
    @State var wishlistProducts: [Product] = []
    
    var body: some View {
        TabView {
            StoreView(wishlistProducts: $wishlistProducts)
                .tabItem {
                    Label(Constants.storeLabel, systemImage: Constants.storeImage)
                }
            WishListView(wishlistProducts: $wishlistProducts)
                .tabItem {
                    Label(Constants.wishListLabel, systemImage: Constants.wishListImage)
                }
            ProfileView()
                .tabItem {
                    Label(Constants.profileLabel, systemImage: Constants.profileImage)
                }
        }
        .tint(Color.orange)
    }
}

#if DEBUG
struct StoreTabView_Previews: PreviewProvider {
    static var previews: some View {
        StoreTabView(wishlistProducts: productList)
            .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
            .previewDisplayName("iPhone 13 Pro Max")
        StoreTabView(wishlistProducts: productList)
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
            .previewDisplayName("iPhone SE (3rd generation)")
    }
}
#endif
