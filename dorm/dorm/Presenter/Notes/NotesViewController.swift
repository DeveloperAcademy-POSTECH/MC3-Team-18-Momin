//
//  NotesViewController.swift
//  dorm
//
//  Created by 한택환 on 2022/07/29.
//

import UIKit

final class NotesViewController: UIViewController {
    
    private var notesView: NotesView = NotesView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func loadView() {
        super.loadView()
        view = notesView
        view.backgroundColor = .white
    }
}

extension NotesViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ nameField: UITextField) -> Bool {
        nameField.resignFirstResponder()
        return true
    }
}

#if DEBUG
import SwiftUI
struct NotesViewControllerPreview: PreviewProvider {
    static var previews: some View {
        UINavigationController(rootViewController: NotesViewController())
            .toPreview()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
#endif
