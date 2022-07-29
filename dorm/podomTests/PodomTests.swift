//
//  podomTests.swift
//  podomTests
//
//  Created by JongHo Park on 2022/07/29.
//

@testable import dorm
import XCTest

final class StudentRepositoryTests: XCTestCase {
    private var studentRepository: StudentRepository! = StudentFirebaseRepository.shared

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func testCreateStudents() async throws {
        // given
        print("create Students 테스트 시작")
        let students: [Student] = MockDatas().students
        let id: String = "test"
        var result: [Student]?
        // when
        result = try await studentRepository.createStudents(id, students)
        // then
        XCTAssertEqual(students.count, result?.count)
    }

}
