//
//  HeaderView.swift
//  ChatApp
//
//  Created by Rubiya Faniband on 25/11/24.
//

import SwiftUI

struct HeaderView: View {
    let title: String

    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: UIConstants.Font.header,
                              weight: .bold))
                .foregroundColor(.primary)
            
            Spacer()
            Image(systemName: "message.fill")
                .resizable()
                .frame(width: UIConstants.Icon.medium,
                       height: UIConstants.Icon.medium)
                .foregroundColor(.blue)
        }
        .padding()
        .background(Color(.systemGray6))
        .defaultShadow()
    }
}

#Preview {
    HeaderView(title: UIConstants.Strings.empty)
}
