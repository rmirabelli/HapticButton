//
//  HapticEvents.swift
//  HapticButtonTest
//
//  Created by Russell Mirabelli on 7/31/19.
//  Copyright © 2019 Bottle Rocket. All rights reserved.
//

import UIKit

public enum HapticEvent {
    case light
    case medium
    case strong

    public func play() {
        switch self {
        case .light: UIImpactFeedbackGenerator(style: .light).impactOccurred()
        case .medium: UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        case .strong: UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
        }
    }
}
