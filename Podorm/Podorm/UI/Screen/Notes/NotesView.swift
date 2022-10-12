//
//  NotesView.swift
//  Podorm
//
//  Created by Minkyeong Ko on 2022/09/02.
//

import SwiftUI

struct NotesView: View {
    @Binding var showNotesView: Bool
    @Binding var studentInfo: Student

    init(showNotesView: Binding<Bool>, studentInfo: Binding<Student>) {
        self._showNotesView = showNotesView
        self._studentInfo = studentInfo
    }

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("\(studentInfo.name)")
                    .font(.system(size: 22, weight: .bold))
                    .padding(.bottom)
                Text("\(studentInfo.notes ?? "")")
                    .font(.system(size: 17))
                    .foregroundColor(.postechRed)
                Spacer()
            }
            .padding(30)
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .topLeading
            )
            .toolbar(content: toolbarNotes)
            .navigationBarTitle("", displayMode: .inline)
        }
    }
}

private extension NotesView {
    @ToolbarContentBuilder
    func toolbarNotes() -> some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Button(action: {
                showNotesView = false
            }, label: {
                HStack {
                    Image(systemName: "chevron.left")
                    Text("Dorm Manager")
                }
                .foregroundColor(.postechRed)
            })
        }
        ToolbarItem(placement: .principal) {
            Text("\(studentInfo.roomNumber)")
        }
        ToolbarItem(placement: .automatic) {
            Button(action: {
                // TODO: 파이어베이스에 저장
            }, label: {
                Text("Save")
                    .foregroundColor(.postechRed)
            })
        }
    }
}

struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        NotesView(showNotesView: .constant(true), studentInfo: .constant(Student(110293, "James", "James", 101, 0, "이런 저런 이유로 방을 바꿔야 함")))
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
