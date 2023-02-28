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
    var body: some View {
        TabView {
            StoreView()
                .badge(2)
                .tabItem {
                    Label(Constants.storeLabel, systemImage: Constants.storeImage)
                }
            WishListView()
                .tabItem {
                    Label(Constants.wishListLabel, systemImage: Constants.wishListImage)
                }
            ProfileView()
                .tabItem {
                    Label(Constants.profileLabel, systemImage: Constants.profileImage)
                }
        }
    }
}

#if DEBUG
struct StoreTabView_Previews: PreviewProvider {
    static var previews: some View {
        StoreTabView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
            .previewDisplayName("iPhone 13 Pro Max")
        StoreTabView()
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
            .previewDisplayName("iPhone SE (3rd generation)")
    }
}
#endif
