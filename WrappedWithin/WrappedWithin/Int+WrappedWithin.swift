//
//  Int+WrappedWithin.swift
//  WrappedWithin
//
//  Created by Shawn Gee on 7/22/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

import Foundation

public extension Int {
    func wrappedWithin(count: Int) -> Int {
        (self % count + count) % count
    }
}
