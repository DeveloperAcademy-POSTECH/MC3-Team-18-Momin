//
//  StudentRepository.swift
//  dorm
//
//  Created by JongHo Park on 2022/07/29.
//

protocol StudentRepository {

    /// 각 기숙사 관리자가 관리하는 student 들을 추가하는 함수
    /// - Parameters:
    ///   - id: 기숙사 관리자의 id
    ///   - students: student 배열
    /// - Returns: 성공적으로 create 헀다면 Student 의 배열을, 만약 실패했다면 에러를 던진다
    func createStudents(_ id: String, _ students: [Student]) async throws -> [Student]
}
