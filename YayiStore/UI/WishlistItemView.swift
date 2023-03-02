//
//  WishlistItemView.swift
//  YayiStore
//
//  Created by Yair Cid on 01/03/23.
//

import SwiftUI

private enum Constants {
    static let doubleSpecifier = "%.2f"
    static let imageWidth = 180.0
    static let imageHeight = 120.0
    static let cornerRadius = 20.0
}

struct WishlistItemView: View {
    var product: Product
    
    var body: some View {
        VStack(alignment: .trailing) {
            HStack {
                Image(product.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: Constants.imageWidth, maxHeight: Constants.imageHeight)
                    .cornerRadius(Constants.cornerRadius)
                
                VStack (alignment: .leading) {
                    Text(product.description)
                    Spacer()
                    Text("$\(product.price, specifier: Constants.doubleSpecifier)")
                }
                .frame(maxWidth: Constants.imageWidth, maxHeight: Constants.imageHeight)
            }
            .padding(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#if DEBUG
struct WishlistItemView_Peviews: PreviewProvider {
    static var previews: some View {
        WishlistItemView(product: productList[1])
            .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
            .previewDisplayName("iPhone 13 Pro Max")
        
        WishlistItemView(product: productList[1])
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
            .previewDisplayName("iPhone SE (3rd generation)")
    }
}
#endif
