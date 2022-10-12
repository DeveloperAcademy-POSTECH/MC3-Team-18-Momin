//
//  TempViewForNoteView.swift
//  Podorm
//
//  Created by Minkyeong Ko on 2022/09/05.
//

import SwiftUI

struct TempViewForNoteView: View {
    @State private var showNotesView = false
    @State private var studentInfo = Student(110293, "James", "James", 101, 0, "이런 저런 이유로 방을 바꿔야 함")

    var body: some View {
        VStack {
            Button("Show NotesView") {
                showNotesView = true
            }
        }
        .sheet(isPresented: $showNotesView) {
            NotesView(showNotesView: $showNotesView, studentInfo: $studentInfo)
        }
    }
}

struct TempViewForNoteView_Previews: PreviewProvider {
    static var previews: some View {
        TempViewForNoteView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
