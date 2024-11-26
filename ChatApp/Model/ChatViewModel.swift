//
//  ChatViewModel.swift
//  ChatApp
//
//  Created by Rubiya Faniband on 25/11/24.
//

import Foundation

struct ChatMessage: Identifiable, Equatable {
    let id = UUID()
    let content: String
    let isUserMessage: Bool
}

final class ChatViewModel: ObservableObject {
    @Published var messages: [ChatMessage] = []
    
    let funnyResponses = [
           "Houston, we have a message! 🚀",
           "Did you know? Space smells like burnt steak! 🥩",
           "Want to explore Mars together? 🪐",
           "You're out of this world! 🌟",
           "Astronauts love snacks in zero gravity! 🍪",
           "Oops, I think I just found an alien! 👽",
           "Time flies faster in space, just like our chat! ⏳",
           "Why did the astronaut break up with the moon? Too much space. 🌙",
           "Ever wondered what floating feels like? Let’s imagine! 💫",
           "Black holes really suck! 🌀",
           "Earth called, it wants its gravity back! 🌍",
           "Rockets are just giant tubes of boom! 🚀",
           "Stargazing is the universe winking at you! ✨",
           "My favorite planet? Uranus, for obvious reasons! 😂"
       ]
    
    func sendMessage(_ text: String) {
        let userMessage = ChatMessage(content: text, isUserMessage: true)
        messages.append(userMessage)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5)) {
            let randomResponse = self.funnyResponses.randomElement() ?? "I'm here to make you smile! 😊"
            let botMessage = ChatMessage(content: randomResponse, isUserMessage: false)
            self.messages.append(botMessage)
        }
    }
   
}
