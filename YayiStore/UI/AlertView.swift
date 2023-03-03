//
//  AlertView.swift
//  YayiStore
//
//  Created by Yair Cid on 02/03/23.
//

import SwiftUI

private enum Constants {
    static let clearColorHeight = 0.93
    static let cornerRadius = 20.0
    static let clipCornerRadius = 10.0
    static let shadowRadius = 3.0
    static let alertOpacity = 1.0
    static let animationDuration = 2.0
    static let alertDeadline = 0.3
}

struct AlertView: View {
    @State var alertVisible: Bool = true
    @Binding var alertMessage: String
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Color.clear
                    .frame(height: geo.size.height * Constants.clearColorHeight)
                Color.green
                    .overlay(
                        Text(alertMessage)
                            .font(.headline)
                            .foregroundColor(.white)
                    )
                    .cornerRadius(Constants.cornerRadius)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: Constants.clipCornerRadius))
                    .shadow(radius: Constants.shadowRadius)
            }
            .padding([.leading, .trailing])
            .opacity(alertVisible ? Constants.alertOpacity : .zero)
            .animation(.easeInOut(duration: Constants.animationDuration),
                       value: alertVisible)
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + Constants.alertDeadline,
                                              execute: {
                    if alertVisible == true {
                        alertVisible = false
                    }
                    
                })
            })
        }
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView(alertMessage: .constant(""))
            .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
            .previewDisplayName("iPhone 13 Pro Max")
        AlertView(alertMessage: .constant(""))
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
            .previewDisplayName("iPhone SE (3rd generation)")
    }
}
