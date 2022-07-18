//
//  Student.swift
//  dorm
//
//  Created by JongHo Park on 2022/07/18.
//

// MARK: - Entity Declaration
struct Student: Codable {
    let id: Int // 학번
    let name: String // 학생 이름
    let nickname: String? // 학생 닉네임
    let roomNumber: Int // 거주하는 방 호수
    let state: Int //현재 거주 상태
}

// MARK: - toString
extension Student: CustomStringConvertible {
    var description: String {
        "학번: \(id) 이름: \(name) 호수: \(roomNumber) 체크인 상태: \(checkInState)"
    }
}

// MARK: - property to Readable String
extension Student {
    var checkInState: String {
        switch state {
        case 0:
            return "체크인 대기 중"
        case 1:
            return "체크인"
        default:
            fatalError("unknown checkIn status")
        }
    }
}
