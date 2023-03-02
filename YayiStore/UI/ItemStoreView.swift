//
//  ItemStoreView.swift
//  YayiStore
//
//  Created by Yair Cid on 01/03/23.
//

import SwiftUI

private enum Constants {
    static let plusImage = "plus"
    static let minusImage = "minus"
    static let shareImage = "square.and.arrow.up"
    static let heartImage = "heart"
    static let heartFilledImage = "heart.fill"
    static let starImage = "star.fill"
    static let doubleSpecifier = "%.2f"
    static let vstackSpacing = 15.0
    static let imageWidth = 180.0
    static let imageHeight = 120.0
    static let clipCornerRadius = 10.0
    static let shadowRadius = 3.0
    static let shadowXPosition = 0.0
    static let shadowYPosition = 1.0
}

struct ItemStoreView: View {
    var product: Product
    @State var heartToggle: Bool = false
    @Binding var wishlistProducts: [Product]
    
    var body: some View {
        VStack {
            HStack (alignment: .top) {
                VStack (spacing: Constants.vstackSpacing) {
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: Constants.plusImage)
                            .foregroundColor(.black)
                    })
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: Constants.minusImage)
                            .foregroundColor(.black)
                    })
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: Constants.shareImage)
                            .foregroundColor(.black)
                    })
                }.padding([.top, .leading])
                
                Image(product.image)
                    .resizable()
                    .frame(maxWidth: Constants.imageWidth, maxHeight: Constants.imageHeight)
                    .padding(.top)
                
                Button(action: {
                    if !heartToggle {
                        wishlistProducts.append(product)
                    } else {
                        wishlistProducts.removeAll(where: { $0.id == product.id })
                    }
                    heartToggle.toggle()
                }, label: {
                    Image(systemName: heartToggle ? Constants.heartFilledImage : Constants.heartImage)
                        .foregroundColor(heartToggle ? .red: .black)
                })
                .padding([.top, .trailing])
            }
            
            Text(product.description)
            
            HStack {
                Text("$\(product.price, specifier: Constants.doubleSpecifier)")
                    .padding()
                Spacer()
                HStack {
                    Text("\(product.rating, specifier: Constants.doubleSpecifier)")
                    Image(systemName: Constants.starImage)
                        .foregroundColor(Color.yellow)
                }
            }
        }
        .background(.white)
        .clipped()
        .clipShape(RoundedRectangle(cornerRadius: Constants.clipCornerRadius))
        .shadow(color: Color.gray,
                radius: Constants.shadowRadius,
                x: Constants.shadowXPosition,
                y: Constants.shadowYPosition)
    }
}

#if DEBUG
struct ItemStoreView_Peviews: PreviewProvider {
    static var previews: some View {
        ItemStoreView(product: productList[1], wishlistProducts: .constant(productList))
            .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
            .previewDisplayName("iPhone 13 Pro Max")
        
        ItemStoreView(product: productList[1], wishlistProducts: .constant(productList))
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
            .previewDisplayName("iPhone SE (3rd generation)")
    }
}
#endif
