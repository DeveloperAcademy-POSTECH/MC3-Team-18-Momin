//
//  Interactors.swift
//  Podorm
//
//  Created by JongHo Park on 2022/08/26.
//

import Foundation

extension DIContainer {

    struct Interactors {
        let documentPickerInteractor: DocumentPickerInteractor
        
        init(documentPickerInteractor: DocumentPickerInteractor) {
            self.documentPickerInteractor = documentPickerInteractor
        }
    }

}

// MARK: - For previews
#if DEBUG
extension DIContainer.Interactors {
    static var preview: DIContainer.Interactors {
        DIContainer.Interactors(documentPickerInteractor: RealDocumentPickerInteractor())
    }
}
#endif
