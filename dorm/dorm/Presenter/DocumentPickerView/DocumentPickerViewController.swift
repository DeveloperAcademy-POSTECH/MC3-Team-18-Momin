//
//  DocumentPickerViewController.swift
//  dorm
//
//  Created by 한택환 on 2022/07/19.
//

import UIKit
import UniformTypeIdentifiers

final class DocumentPickerViewController: UIViewController {
    //TODO: - 임시 UIDocumentPickerViewController를 불러오기 위한 버튼
    @IBOutlet weak var openDocumentButton: UIButton!
    private var csvUrl: URL?
    override func viewDidLoad() {
        super.viewDidLoad()
        setOpenDocumentButton()
    }
    @IBAction func didTapUploadFile(sender: UIButton) {
        if presentedViewController == nil {
            let csvTypes: [UTType] = [.data]
            let documentPicker = UIDocumentPickerViewController(forOpeningContentTypes: csvTypes, asCopy: true)
            documentPicker.delegate = self
            documentPicker.modalPresentationStyle = .pageSheet
            present(documentPicker, animated: true)
        }
    }
}
extension DocumentPickerViewController: UIDocumentPickerDelegate {
    func setOpenDocumentButton() {
        openDocumentButton.frame.size = CGSize(width: 300, height: 50)
        openDocumentButton.center = CGPoint(x: UIScreen.main.bounds.width - 60, y: 60)
        openDocumentButton.setTitle("import", for: .normal)
        openDocumentButton.setTitleColor(UIColor.red, for: .normal)
    }
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentAt url: URL) {
        dismiss(animated: true)
        guard url.startAccessingSecurityScopedResource() else {
            url.stopAccessingSecurityScopedResource()
            return
        }
        url.stopAccessingSecurityScopedResource()
        csvUrl = url
    }
}
