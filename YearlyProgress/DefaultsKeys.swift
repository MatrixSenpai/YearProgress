//
//  DefaultsKeys.swift
//  YearlyProgress
//
//  Created by Mason Phillips on 2/3/18.
//  Copyright © 2018 Matrix Studios. All rights reserved.
//

import UIKit
import SwiftyUserDefaults

extension DefaultsKeys {
    static let shouldHaveBackground = DefaultsKey<Bool>("background-enabled")
    static let background = DefaultsKey<BackgroundType>("background")
}

enum BackgroundType: String {
    case None
    case League = "league"
    case Nature = "nature"
}

extension UserDefaults {
    subscript(key: DefaultsKey<BackgroundType>) -> BackgroundType {
        get { return unarchive(key) ?? .None }
        set { archive(key, newValue) }
    }
}
