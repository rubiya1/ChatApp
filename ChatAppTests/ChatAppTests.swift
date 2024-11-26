//
//  ChatAppTests.swift
//  ChatAppTests
//
//  Created by Rubiya Faniband on 25/11/24.
//

import Testing
import XCTest

@testable import ChatApp

final class ChatViewModelTests: XCTestCase {
    func test_GivenUserSendsMessage_WhenBotRepliesAfterDelay_ThenMessagesAreAppendedCorrectly() {

        let viewModel = ChatViewModel()
        XCTAssertEqual(viewModel.messages.count, 0, "Messages should initially be empty.")

        viewModel.sendMessage("Hello!")
        
        XCTAssertTrue(viewModel.messages.first?.isUserMessage == true)
        XCTAssertEqual(viewModel.messages.count, 1, "Expected 1 message immediately after sending.")
        XCTAssertEqual(viewModel.messages.first?.content, "Hello!", "The content of the first message should match the user input.")
        XCTAssertTrue(viewModel.messages.first?.isUserMessage ?? false, "The first message should be marked as a user message.")
        
        let expectation = XCTestExpectation(description: "Wait for bot reply")
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.1) {
            XCTAssertEqual(viewModel.messages.count, 2, "Expected 2 messages after bot reply.")
            XCTAssertFalse(viewModel.messages.last?.isUserMessage ?? true, "The last message should be from the bot.")
            XCTAssertTrue(viewModel.funnyResponses.contains(viewModel.messages.last?.content ?? ""),
                          "The bot reply should match one of the funny responses.")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 6)
    }
}
