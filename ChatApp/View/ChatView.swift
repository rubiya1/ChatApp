//
//  ChatView.swift
//  ChatApp
//
//  Created by Rubiya Faniband on 25/11/24.
//

import SwiftUI

struct ChatView: View {
    @StateObject private var viewModel = ChatViewModel()
    
    var body: some View {
        HeaderView(title: "Chat with AstroAI")
        
        ScrollViewReader { scrollView in
            ScrollView {
                VStack(spacing: UIConstants.Spacing.medium) {
                    ForEach(viewModel.messages) { message in
                        MessageBubbleView(message: message)
                    }
                }
            }
            .onChange(of: viewModel.messages) { _, _ in
                if let lastMessage = viewModel.messages.last {
                    scrollView.scrollTo(lastMessage.id, anchor: .bottom)
                }
            }
        }
        InputBarView { text in
            viewModel.sendMessage(text)
        }
    }
}

#Preview {
    ChatView()
}
