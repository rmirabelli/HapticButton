//
//  HapticButton.swift
//  HapticButtonTest
//
//  Created by Russell Mirabelli on 7/25/19.
//  Copyright © 2019 Bottle Rocket. All rights reserved.
//

import UIKit

@propertyWrapper
public class HapticButton<B> {

    /// What kind of selection type the user will experience.
    /// light, medium, and strong should be self-explanatory.
    /// selection is a medium when unselected, and light when
    /// selected. Note that you are responsible for managing
    /// selected state.
    public enum FeedbackStyle {
        case light
        case medium
        case strong
        case selection
    }

    // DONE provide an enumeration of haptic types
    // DONE initializer with enumerated value
    // TODO actually implement haptics
    // TODO try to get rid of the force unwrap
    // TODO userdefaults for disabling

    private var value: B?
    private let style: FeedbackStyle

    public init(_ initialValue: B, type: FeedbackStyle) {
        precondition(initialValue is UIButton, "HapticButton may only be used with UIButtons")
        value = initialValue
        style = type
    }

    public init(type: FeedbackStyle) {
        value = nil
        style = type
    }

    @objc private func thump() {
        switch self.style {
        case .light: HapticEvent.light.play()
        case .medium: HapticEvent.medium.play()
        case .strong: HapticEvent.strong.play()
        case .selection:
            if let btn = self.value as? UIButton {
                if btn.isSelected {
                    HapticEvent.light.play()
                } else {
                    HapticEvent.medium.play()
                }
            }
        }
    }

    public var wrappedValue: B {
        get { value! }
        set {
            value = newValue
            if let btn = value as? UIButton {
                btn.addTarget(self, action: #selector(thump),for: UIControl.Event.touchDown)

            }
        }
    }

}
