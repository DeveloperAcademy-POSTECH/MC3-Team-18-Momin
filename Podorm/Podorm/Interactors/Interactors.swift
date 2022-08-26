//
//  Interactors.swift
//  Podorm
//
//  Created by JongHo Park on 2022/08/26.
//

import Foundation

extension DIContainer {

    struct Interactors {

    }

}

// MARK: - For previews
#if DEBUG
extension DIContainer.Interactors {
    static var preview: DIContainer.Interactors {
        DIContainer.Interactors()
    }
}
#endif
