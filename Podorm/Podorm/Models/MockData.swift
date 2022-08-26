//
//  MockData.swift
//  Podorm
//
//  Created by JongHo Park on 2022/08/26.
//

#if DEBUG
extension Student {
    static var mockData: [Student] = [
        Student(2015112224, "Nick", nil, 101, 0),
        Student(2015112224, "Jim", nil, 101, 0)
    ]
}

extension DormRoom {
    static var mockData: [DormRoom] = [
        DormRoom(101, 2, []),
        DormRoom(102, 2, []),
        DormRoom(103, 2, []),
        DormRoom(104, 2, []),
        DormRoom(105, 2, []),
        DormRoom(106, 2, []),
        DormRoom(107, 2, []),
        DormRoom(108, 2, []),
        DormRoom(109, 2, []),
        DormRoom(110, 2, []),
        DormRoom(111, 2, []),
        DormRoom(112, 2, []),
        DormRoom(113, 2, []),
        DormRoom(114, 2, []),
        DormRoom(115, 2, [])
    ]
}
#endif
