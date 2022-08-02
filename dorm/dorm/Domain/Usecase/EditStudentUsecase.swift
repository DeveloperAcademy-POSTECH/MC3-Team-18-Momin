//
//  EditStudentUsecase.swift
//  dorm
//
//  Created by Minkyeong Ko on 2022/07/31.
//

protocol EditStudentUsecase {

    /// 학생 정보를 수정하는 함수
    /// - Parameters:
    ///   - id: 학생의 id
    ///   - students: 학생 배열
    /// - Returns: 성공 시 업데이트 된 학생 배열, 실패 시 에러를 던진다.
    func editStudent(_ id: String, student: Student) async throws -> Student
}

final class EditStudentUsecaseImpl {

    // MARK: - Properties
    private let studentRepository: StudentRepository

    // MARK: - class Lifecycle
    init(_ studentRepository: StudentRepository = StudentFirebaseRepository.shared) {
        self.studentRepository = studentRepository
    }

}

// MARK: - Usecase Implements section
extension EditStudentUsecaseImpl: EditStudentUsecase {

    func editStudent(_ id: String, student: Student) async throws -> Student {
        return try await studentRepository.editStudent(id, student)
    }

}
