//
//  WhatsNew.swift
//  FirebaseWhatsNew
//
//  Created by Gavin Kwon on 10/4/23.
//

import Foundation
import SwiftUI

struct WhatsNewArticle: Decodable, Identifiable {
    
    var id: Int
    var whatsNewImageURL: String?
    var whatsNewTitle: String?
    var whatsNewText: String
    var whatsNewLink: String?
    var whatsNewBgColor: String?
    var whatsNewTextColor: String?
    
    var backgroundUIColor: Color? {
            if let bgColor = whatsNewBgColor {
                return Color(hex: bgColor)
            }
            return nil
        }

        var textUIColor: Color? {
            if let textColor = whatsNewTextColor {
                return Color(hex: textColor)
            }
            return nil
        }
    
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0

        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
