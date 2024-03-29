//
//  Student.swift
//  Podorm
//
//  Created by JongHo Park on 2022/08/26.
//

import Foundation

/// 학생 정보를 나타내는 struct
struct Student: Codable {
    let id: Int // 학번
    let name: String // 학생 이름
    let nickname: String? // 학생 닉네임
    let roomNumber: Int // 거주하는 방 호수
    let state: Int // 현재 거주 상태
    let notes: String? // 학생 관련 메모

    /// Student initializer
    /// - Parameters:
    ///   - id: 학번
    ///   - name: 학생 이름
    ///   - nickname: 학생 닉네임 (이름이 너무 길면 사용자가 단축가능)
    ///   - roomNumber: 거주하는 방 호수
    ///   - state: 현재 체크인 상태
    init(_ id: Int, _ name: String, _ nickname: String?, _ roomNumber: Int, _ state: Int, _ notes: String) {
        self.id = id
        self.name = name
        self.nickname = nickname
        self.roomNumber = roomNumber
        self.state = state
        self.notes = notes
    }
}

extension Student: Equatable, Hashable {
    static func == (lhs: Student, rhs: Student) -> Bool {
        lhs.id == rhs.id && lhs.name == rhs.name && lhs.nickname == rhs.nickname && lhs.state == rhs.state && lhs.roomNumber == rhs.roomNumber
    }
}

// MARK: - toString
extension Student: CustomStringConvertible {
    var description: String {
        "학번: \(id) 이름: \(name) 호수: \(roomNumber) 체크인 상태: \(checkInState)"
    }
}

// MARK: - Public Interfaces
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

// MARK: - icon
#if canImport(SwiftUI)
import SwiftUI

// TODO: 상태에 맞는 아이콘 추가해야함
extension Student {
    var icon: Image {
        switch state {
        case 0:
            return Image(systemName: "person.fill")
        case 1:
            return Image(systemName: "person.fill")
        default:
            fatalError("unknown checkIn status")
        }
    }
}
#endif
