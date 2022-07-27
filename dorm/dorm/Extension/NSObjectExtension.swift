//
//  NSObjectExtension.swift
//  dorm
//
//  Created by JongHo Park on 2022/07/27.
//

import Foundation

extension NSObject {
    static var className: String {
        return String(describing: self)
    }
}
