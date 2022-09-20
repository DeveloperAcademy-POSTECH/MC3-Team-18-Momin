//
//  RoomDetail.swift
//  Podorm
//
//  Created by Keum MinSeok on 2022/09/08.
//

import SwiftUI


// 
struct RoomDetail: View {
    @State private var students: [Student]

    init(students: [Student]) {
        self._students = State(initialValue: students)
    }

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(String(student.roomNumber))
                    .font(.title.bold())
                Spacer()
                Button("Edit") {
                    print("Select")
                }
                .padding(.trailing, 20)
            }
            Text(String(student.name))
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

            HStack {
                Text(String(student.roomNumber))
                    .font(.title.bold())
                Spacer()
                Button("Edit") {
                    print("Select")
                }
                .padding(.trailing, 20)
            }
            Text(String(student.name))
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
    }
}
#endif
