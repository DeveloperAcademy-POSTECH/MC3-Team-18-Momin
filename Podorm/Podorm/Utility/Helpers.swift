//
//  Helpers.swift
//  Podorm
//
//  Created by JongHo Park on 2022/08/26.
//

import Foundation

extension ProcessInfo {
    var isRunningTests: Bool {
        environment["XCTestConfigurationFilePath"] != nil
    }
}
