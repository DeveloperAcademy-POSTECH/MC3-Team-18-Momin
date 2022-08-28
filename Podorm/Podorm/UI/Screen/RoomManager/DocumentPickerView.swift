//
//  DocumentPickerView.swift
//  Podorm
//
//  Created by 한택환 on 2022/08/29.
//

import SwiftUI
import UIKit

struct DocumentPickerView: UIViewControllerRepresentable {
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<DocumentPickerView>) -> UIDocumentPickerViewController {
        let controller: UIDocumentPickerViewController
        
        if #available(iOS 14, *) {
            controller = UIDocumentPickerViewController(forOpeningContentTypes: [.data], asCopy: true)
            return controller
        }
    }
    func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: UIViewControllerRepresentableContext<DocumentPickerView>) { }
}

class DocumentPickerCoordinator: NSObject, UIDocumentPickerDelegate, UINavigationControllerDelegate {
    //TODO: url 저장할 변수 선언 필요
    private func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt url: URL) {
            guard url.startAccessingSecurityScopedResource() else {
                url.stopAccessingSecurityScopedResource()
                return
            }
            url.stopAccessingSecurityScopedResource()
        }
    }

