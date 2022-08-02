//
//  StudentFirebaseRepository.swift
//  dorm
//
//  Created by JongHo Park on 2022/07/29.
//

import FirebaseFirestore
import FirebaseFirestoreSwift

final class StudentFirebaseRepository {
    // MARK: - Properties
    static let shared: StudentFirebaseRepository = StudentFirebaseRepository()
    private let fireStore: Firestore = Firestore.firestore()
    private let collectionName: String = "Students"

    // MARK: - class Lifecycle
    private init() {}
}

// MARK: - StudentRepository API
extension StudentFirebaseRepository: StudentRepository {
    func editStudent(_ id: String, _ student: Student) async throws -> Student {
        let collectionRef = fireStore.collection(getCollectionName(id))
        let studentRef = collectionRef.document(String(student.id))
        try await studentRef.setData(from: student)
        return student
    }

    func createStudents(_ id: String, _ students: [Student]) async throws -> [Student] {
        let collectionRef = fireStore.collection(getCollectionName(id))
        let batch = fireStore.batch()
        for student in students {
            let docRef = collectionRef.document(String(student.id))
            try batch.setData(from: student, forDocument: docRef)
        }
        try await batch.commit()
        return students
    }

}

// MARK: - Utility Functions
private extension StudentFirebaseRepository {

    /// Student Collection 이름을 반환하는 함수
    /// - Parameter id: 동장 식별자
    /// - Returns: Student 컬렉션 이름
    func getCollectionName(_ id: String) -> String {
        "\(id)\(collectionName)"
    }
}
