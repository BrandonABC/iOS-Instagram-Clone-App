//
//  ProfileView.swift
//  InstagramClone
//
//  Created by Brandon Yu on 11/20/23.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    
    var body: some View {
        
            ScrollView {
                // header
                ProfileHeaderView(user: user)
                
                // post grid view
                
                PostGridView(user: user)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)

    }
}

#Preview {
    ProfileView(user: User.MOCK_USER[1])
}
