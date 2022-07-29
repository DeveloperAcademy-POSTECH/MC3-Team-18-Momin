//
//  CreateStudentsUsecase.swift
//  dorm
//
//  Created by JongHo Park on 2022/07/29.
//

protocol CreateStudentsUsecase {

    /// 학생 배열을 DB 에 저장하는 함수
    /// - Parameters:
    ///   - id: 동장 고유 식별자
    ///   - students: 학생 배열
    /// - Returns: 성공 시 등록한 학생 배열, 실패 시 에러를 던진다.
    func createStudents(_ id: String, students: [Student]) async throws -> [Student]
}

final class CreateStudentsUsecaseImpl {

    // MARK: - Properties
    private let studentRepository: StudentRepository

    // MARK: - class Lifecycle
    init(_ studentRepository: StudentRepository = StudentFirebaseRepository.shared) {
        self.studentRepository = studentRepository
    }

}

// MARK: - Usecase Implements section
extension CreateStudentsUsecaseImpl: CreateStudentsUsecase {

    func createStudents(_ id: String, students: [Student]) async throws -> [Student] {
        return try await studentRepository.createStudents(id, students)
    }

}
