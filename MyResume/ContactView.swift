//
//  ContactView.swift
//  MyResume
//
//  Created by Chris on 2024/4/4.
//

import SwiftUI

struct ContactView: View {
   
    @Binding var isShowing: Bool
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "phone.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                    .padding(10)
                    .background(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)).foregroundColor(.black))
                    .padding(10)
                ForEach(Resume.shared.socialMedia, id: \.name) { media in
                    Image(media.name.lowercased())
                        .resizable().aspectRatio(contentMode: .fit)
                        .padding(10)
                }
            }
            Text("取消")
                .font(.title3)
                .foregroundColor(.secondary)
                .onTapGesture {
                     isShowing = false
                }
        }
        .padding()
            .background(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)).foregroundColor(.white))
        .padding()

    }
}

#Preview {
    ContactView(isShowing: Binding.constant(true))
        .background(.secondary)
}
