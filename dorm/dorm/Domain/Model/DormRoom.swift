//
//  DormRoom.swift
//  dorm
//
//  Created by JongHo Park on 2022/07/18.
//

/// 기숙사 방을 나타내는 struct
struct DormRoom: Codable {
    let roomNumber: Int // Room 고유의 아이디
    let maxNumber: Int // 최대 정원 수
    let currentMembers: [Int] // 현재 입실한 학생 id 배열

    /// DormRoom Initializer
    /// - Parameters:
    ///   - roomNumber: 방 호수
    ///   - maxNumber: 방 정원
    ///   - currentMembers: 현재 멤버들 id
    init(_ roomNumber: Int, _ maxNumber: Int, _ currentMembers: [Int]) {
        self.roomNumber = roomNumber
        self.maxNumber = maxNumber
        self.currentMembers = currentMembers
    }
}

// MARK: - toString
extension DormRoom: CustomStringConvertible {
    var description: String {
        "방 호수: \(roomNumber) 최대 정원: \(maxNumber)인 현재 인원 수 \(currentMembers.count)"
    }
}
