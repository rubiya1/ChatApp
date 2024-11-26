//
//  Color.swift
//  ChatApp
//
//  Created by Rubiya Faniband on 25/11/24.
//

import SwiftUI

enum UIConstants {
    enum Font {
        static let header: CGFloat = 24.0
        static let body: CGFloat = 16.0
        static let caption: CGFloat = 12.0
    }
    
    enum Icon {
        static let small: CGFloat = 16.0
        static let medium: CGFloat = 28.0
        static let large: CGFloat = 44.0
    }
    
    enum Spacing {
        static let small: CGFloat = 8.0
        static let medium: CGFloat = 16.0
        static let large: CGFloat = 20.0
        static let extraLarge: CGFloat = 25.0
    }
    
    enum Colors {
        static let background = Color(.systemGray6)
        static let primaryText = Color.primary
        static let secondaryText = Color.secondary
        static let accent = Color.blue
    }
    
    enum Strings {
        static let empty = ""
    }
    
    enum Shadow {
        static let color = Color.black.opacity(0.1)
        static let radius: CGFloat = 3.0
        static let offsetX: CGFloat = 0
        static let offsetY: CGFloat = -2
    }
    
    enum Radius {
        static let small: CGFloat = 8.0
        static let medium: CGFloat = 16.0
    }
}

extension View {
    func defaultShadow() -> some View {
        self.shadow(color: UIConstants.Shadow.color,
                    radius: UIConstants.Shadow.radius,
                    x: UIConstants.Shadow.offsetX,
                    y: UIConstants.Shadow.offsetY)
    }
}
