//
//  MessageBubbleView.swift
//  ChatApp
//
//  Created by Rubiya Faniband on 25/11/24.
//

import SwiftUI

struct MessageBubbleView: View {
    let message: ChatMessage
    var body: some View {
        HStack {
            if message.isUserMessage {
                Spacer()
                messageText
            } else {
                messageText
                Spacer()
            }
        }
    }
    
    private var messageText: some View {
        Text(message.content)
            .padding()
            .background(message.isUserMessage ? Color.userMessage : Color.botMessage)
            .cornerRadius(UIConstants.Radius.medium)
            .foregroundColor(message.isUserMessage ? .white : .primary)
            .frame(maxWidth: 250, alignment: message.isUserMessage ? .trailing : .leading)
            .padding(message.isUserMessage ? .trailing : .leading, UIConstants.Spacing.medium)
    }
}

#Preview {
    MessageBubbleView(message: .init(content: "Hello, World!",
                                     isUserMessage: true))
}
