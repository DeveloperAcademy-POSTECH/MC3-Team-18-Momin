//
//  RoomGridCell.swift
//  Podorm
//
//  Created by JongHo Park on 2022/08/26.
//

import SwiftUI

struct RoomGridCell: View {
    private let room: DormRoom
    @State private var students: Loadable<[Student]>
    private let selected: Bool
    private let onClick: () -> Void
    init(room: DormRoom, selected: Bool = false, students: Loadable<[Student]> = .notRequested, _ onClick: @escaping () -> Void = {}) {
        self.room = room
        self._students = State(initialValue: students)
        self.selected = selected
        self.onClick = onClick
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text(String(room.roomNumber))
                .fontWeight(.semibold)
            ZStack {
                roundedRectangle()
                content()
            }
            .frame(width: 117, height: 104, alignment: .center)
        }
        .onAppear {
            loadStudents(of: room)
        }
    }
}

// MARK: - Common UI Componenets
private extension RoomGridCell {

    @ViewBuilder
    func roundedRectangle() -> some View {
        RoundedRectangle(cornerRadius: 8)
            .stroke(Color.postechRed, lineWidth: 1)
            .background(RoundedRectangle(cornerRadius: 8)
                .fill(selected ? Color.postechRed : Color.clear))

    }
}

// MARK: - Side Effects
private extension RoomGridCell {

    // TODO: Interact with Interactors
    func loadStudents(of room: DormRoom) {

    }

}

// MARK: - Content
private extension RoomGridCell {

    @ViewBuilder
    func content() -> some View {
        switch students {
        case .notRequested:
            EmptyView()
        case .isLoading:
            loading()
        case .loaded(let students):
            loaded(students)
        case .failed(let error):
            failed(error)
        }
    }
}

// MARK: - Loading View
private extension RoomGridCell {

    func loading() -> some View {
        VStack(spacing: 8) {
            ProgressView()
            Text("Loading...")
                .fontWeight(.light)
        }
    }

}

// MARK: - Loaded View
private extension RoomGridCell {

    func loaded(_ students: [Student]) -> some View {
        HStack(spacing: 0) {
            ForEach(students, id: \.self) { student in
                studentInfo(student)
                if student != students.last {
                    Divider()
                        .frame(width: 1)
                        .background(selected ? Color.white : Color.postechRed)
                }
            }
        }
        .onTapGesture(perform: onClick)
    }

    func studentInfo(_ student: Student) -> some View {
        VStack {
            Spacer()
            student.icon
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))
            Text(student.nickname ?? student.name)
            Spacer()
        }
        .foregroundColor(selected ? .white : .postechRed)
        .frame(maxWidth: .infinity, alignment: .center)
    }

}

// MARK: - Failed View
private extension RoomGridCell {

    func failed(_ error: Error) -> some View {
        Button {
            loadStudents(of: room)
        } label: {
            Text("Error occur..\nPlease retry")
                .font(.caption)
        }
        .buttonStyle(.borderedProminent)
    }
}

#if DEBUG
// MARK: - Preview
struct RoomGridCell_Previews: PreviewProvider {

    static func makePreview(_ students: Loadable<[Student]>, selected: Bool = false) -> some View {
        RoomGridCell(room: DormRoom.mockData.first!, selected: selected, students: students) {

        }
        .padding()
        .previewLayout(.sizeThatFits)
        .previewInterfaceOrientation(.landscapeLeft)
    }

    static var previews: some View {
        Group {
            makePreview(.isLoading(last: nil))
                .previewDisplayName("Loading View")
            makePreview(.loaded(Student.mockData))
                .previewDisplayName("Loaded View")
            makePreview(.loaded(Student.mockData), selected: true)
                .previewDisplayName("Selected Loaded View")
            makePreview(.failed(NSError()))
                .previewDisplayName("Failed View")
        }
    }
}
#endif
