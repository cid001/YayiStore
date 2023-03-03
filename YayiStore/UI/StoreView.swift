//
//  StoreView.swift
//  YayiStore
//
//  Created by Yair Cid on 27/02/23.
//

import SwiftUI

private enum Constants {
    static let natTitle = "Yayi's Store"
    static let cartImage = "cart.fill"
}

struct StoreView: View {
    @Binding var wishlistProducts: [Product]
    @Binding var alertToggle: Bool
    @Binding var alertMessage:String
    
    var body: some View {
        let columns = [GridItem(spacing: 0.0),
                       GridItem(spacing: 0.0)]
        
        NavigationStack {
            ScrollView {
                LazyVGrid (columns: columns) {
                    ForEach(productList, id: \.id) { item in
                        ItemStoreView(product: item,
                                      wishlistProducts: $wishlistProducts,
                                      alertToogle: $alertToggle,
                                      alertMessage: $alertMessage)
                        .padding([.top, .trailing, .leading])
                    }
                }
            }
            .navigationBarStyle(title: Constants.natTitle, color: .orange)
            .toolbar {
                Button(action: {
                    
                }, label: {
                    Image(systemName: Constants.cartImage)
                        .foregroundColor(.white)
                })
            }
        }
    }
}

struct StoreViewPreview_Previews: PreviewProvider {
    static var previews: some View {
        StoreView(wishlistProducts: .constant(productList), alertToggle: .constant(true), alertMessage: .constant(""))
            .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
            .previewDisplayName("iPhone 13 Pro Max")
        
        StoreView(wishlistProducts: .constant(productList), alertToggle: .constant(true), alertMessage: .constant(""))
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
            .previewDisplayName("iPhone SE (3rd generation)")
    }
}

