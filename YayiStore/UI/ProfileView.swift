//
//  ProfileView.swift
//  YayiStore
//
//  Created by Yair Cid on 27/02/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Hello Profile!")
            }
            .navigationBarStyle(title: "Profile", color: .orange)
        }
    }
}
