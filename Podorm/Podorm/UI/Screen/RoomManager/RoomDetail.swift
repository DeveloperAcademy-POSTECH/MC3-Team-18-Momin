//
//  RoomDetail.swift
//  Podorm
//
//  Created by Keum MinSeok on 2022/09/08.
//

import SwiftUI

struct RoomDetail: View {
    @State private var students: [Student]

    init(students: [Student]) {
        self._students = State(initialValue: students)
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
                Text("101")
                    .font(.title.bold())
                Spacer()
                Button("Edit") {
                    print("Select")
                }
                .padding(.trailing, 20)
            }
            Text("Nick")
                .font(.title3.bold())
                .padding(.top, 4)
            Text("국적")
                .font(.callout)
                .foregroundColor(.gray)
                .padding(.top, 1)
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
        RoomDetail(students: Student.mockData)
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
#endif
