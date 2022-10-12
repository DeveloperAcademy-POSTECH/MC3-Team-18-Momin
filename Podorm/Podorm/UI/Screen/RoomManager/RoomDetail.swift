//
//  RoomDetail.swift
//  Podorm
//
//  Created by Keum MinSeok on 2022/09/08.
//

import SwiftUI

struct RoomDetail: View {
    @State private var students: [Student]
    private let dormRoom: DormRoom?
    init(students: [Student],
         dormRoom: DormRoom?) {
        self._students = State(initialValue: students)
        self.dormRoom = dormRoom
    }

    var body: some View {
        detailSection(students)
    }
}

// MARK: - RoomDetail UI
private extension RoomDetail {

    func detailSection(_ students: [Student]) -> some View {
        VStack {
            ForEach(students, id: \.self) { students in
                detailView(students)
            }
        }
    }

    func detailView(_ students: Student) -> some View {
        VStack(alignment: .leading) {
            HStack {
                Text(dormRoom == nil ? "알 수 없는 방 번호": String(dormRoom!.roomNumber))
                    .font(.title.bold())
                
                Spacer()
                
                Button("Edit") {
                    print("Select")
                }
                .padding(.trailing, 20)
            }

            Text(students.name)
                .font(.title.bold())
                .padding(.top, 4)

            Text("메모 내용 보여지는 곳")
                .foregroundColor(.postechRed)
                .padding(.top, 1)

            Spacer()
        }
    }
}

#if DEBUG
struct RoomDetail_Previews: PreviewProvider {
    static var previews: some View {
        RoomDetail(students: Student.mockData, dormRoom: nil)
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
#endif
