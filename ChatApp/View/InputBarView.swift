//
//  InputBarView.swift
//  ChatApp
//
//  Created by Rubiya Faniband on 25/11/24.
//

import SwiftUI

struct InputBarView: View {
    @State private var inputText = UIConstants.Strings.empty
    var onSend: (String) -> Void
    
    var body: some View {
        HStack {
            TextField("Type Message", text: $inputText)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: UIConstants.Spacing.large)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                )
            
            Button(action: {
                guard !inputText.isEmpty else { return }
                onSend(inputText)
                inputText = UIConstants.Strings.empty
            }) {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.userMessage)
                    .cornerRadius(UIConstants.Spacing.extraLarge)
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .defaultShadow()
    }
}

#Preview {
    InputBarView(onSend: {_ in })
}
