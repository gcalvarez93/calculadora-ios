//
//  Model.swift
//  CalculadoraiOS
//
//  Created by Gabriel Castro on 2/1/24.
//

import Foundation
import SwiftUI

struct KeyboardButton: Hashable {
    let title: String
    let textColor: Color
    let backgroundColor: Color
    let doubleWidth: Bool
    let type: ButtonType
}

enum ButtonType: Hashable {
    case number(Int)
    case operation(OperationType)
    case result
    case reset
}

enum OperationType: Hashable {
    case sum
    case multiplication
}

struct Matrix {
    static let firstSectionData: [KeyboardButton] = [
        .init(title: "AC", textColor: .black, backgroundColor: customLightGray, doubleWidth: false, type: .reset),
        .init(title: "+/-", textColor: .black, backgroundColor: customLightGray, doubleWidth: false, type: .reset),
        .init(title: "%", textColor: .black, backgroundColor: customLightGray, doubleWidth: false, type: .reset),
        .init(title: "/", textColor: .white, backgroundColor: customOrange, doubleWidth: false, type: .reset),
        .init(title: "7", textColor: .white, backgroundColor: customDarkGray, doubleWidth: false, type: .number(7)),
        .init(title: "8", textColor: .white, backgroundColor: customDarkGray, doubleWidth: false, type: .number(8)),
        .init(title: "9", textColor: .white, backgroundColor: customDarkGray, doubleWidth: false, type: .number(9)),
        .init(title: "X", textColor: .white, backgroundColor: customOrange, doubleWidth: false, type: .operation(.multiplication)),
        .init(title: "4", textColor: .white, backgroundColor: customDarkGray, doubleWidth: false, type: .number(4)),
        .init(title: "5", textColor: .white, backgroundColor: customDarkGray, doubleWidth: false, type: .number(5)),
        .init(title: "6", textColor: .white, backgroundColor: customDarkGray, doubleWidth: false, type: .number(6)),
        .init(title: "-", textColor: .white, backgroundColor: customOrange, doubleWidth: false, type: .reset),
        .init(title: "1", textColor: .white, backgroundColor: customDarkGray, doubleWidth: false, type: .number(1)),
        .init(title: "2", textColor: .white, backgroundColor: customDarkGray, doubleWidth: false, type: .number(2)),
        .init(title: "3", textColor: .white, backgroundColor: customDarkGray, doubleWidth: false, type: .number(3)),
        .init(title: "+", textColor: .white, backgroundColor: customOrange, doubleWidth: false, type: .operation(.sum)),
    ]
    
    static let secondSectionData: [KeyboardButton] = [
        .init(title: "0", textColor: .white, backgroundColor: customDarkGray, doubleWidth: true, type: .number(0)),
        .init(title: ",", textColor: .white, backgroundColor: customDarkGray, doubleWidth: false, type: .reset),
        .init(title: "=", textColor: .white, backgroundColor: customOrange, doubleWidth: false, type: .result)
    ]
    
    static let firstSectionGrid: (CGFloat) -> [GridItem] = { width in
        return Array(repeating: GridItem(.flexible(minimum: width), spacing: 0), count: 4)
    }
    
    static let secondSectionGrid: (CGFloat) -> [GridItem] = { width in
        return [GridItem(.flexible(minimum: width * 2), spacing: 0),
                GridItem(.flexible(minimum: width), spacing: 0),
                GridItem(.flexible(minimum: width), spacing: 0)]
        }
}
