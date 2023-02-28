//
//  MainView.swift
//  YayiStore
//
//  Created by Yair Cid on 27/02/23.
//

import SwiftUI

private enum Constants {
    static let navTitle = "Yayi's Store"
    static let cartImage = "cart.fill"
    static let titleSizeDivisor = 2.0
    static let cartWidthDivisor = 0.95
    static let cartHeightDivisor = 2.0
}

struct MainView: View {
    var body: some View {
        NavigationView {
            StoreTabView()
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        GeometryReader { geo in
                            ZStack {
                                VStack {
                                    Text(Constants.navTitle).font(.headline)
                                        .foregroundColor(.blue)
                                }
                                .position(x: geo.size.width / Constants.titleSizeDivisor,
                                          y: geo.size.height / Constants.titleSizeDivisor)
                                
                                VStack {
                                    Button(action: {
                                        
                                    }, label: {
                                        Image(systemName: Constants.cartImage)
                                    })
                                    .foregroundColor(.blue)
                                }
                                .position(x: geo.size.width * Constants.cartWidthDivisor,
                                          y: geo.size.height / Constants.cartHeightDivisor)
                                
                            }
                        }
                    }
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
            .previewDisplayName("iPhone 13 Pro Max")
        
        MainView()
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
            .previewDisplayName("iPhone SE (3rd generation)")
    }
}
