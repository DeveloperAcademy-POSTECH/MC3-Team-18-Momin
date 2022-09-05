//
//  FirebaseRoomRepository.swift
//  Podorm
//
//  Created by JongHo Park on 2022/08/31.
//

import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

final class FirebaseRoomRepository {
    public static let shared: FirebaseRoomRepository = .init()
    private let firestore: Firestore = Firestore.firestore()
    private let auth: Auth = Auth.auth()
    private let collectionName: String
    private var collectionRef: CollectionReference {
        firestore.collection(collectionName)
    }
    private init(isRunningTests: Bool = ProcessInfo.processInfo.isRunningTests) {
        self.collectionName = isRunningTests ? "TestDormRooms" : "DormRooms"
    }
}

extension FirebaseRoomRepository: RoomRepository {
    func addRoom(_ dormRoom: DormRoom) async throws {

    }

    func addStudentToRoom(_ studentId: String, to dormRoom: DormRoom) async throws {

    }

    func removeStudentFromRoom(_ studentId: String, from dormRoom: DormRoom) async throws {
        
    }

    func addRooms(_ dormRooms: [DormRoom]) async throws {
        let batch = firestore.batch()
        for dormRoom in dormRooms {
            try batch.setData(from: dormRoom, forDocument: collectionRef.document(String(dormRoom.roomNumber)))
        }
        try await batch.commit()
    }

    func loadRooms() async throws -> [DormRoom] {
        let result = try await collectionRef.getDocuments()
        return try result.documents.map { (snapshot) -> (DormRoom) in
            try snapshot.data(as: DormRoom.self)
        }
    }

    func removeRooms(_ dormRooms: [DormRoom]) async throws {
        await withThrowingTaskGroup(of: Bool.self) { [self] group in
            for dormRoom in dormRooms {
                group.addTask(priority: .userInitiated) {
                    try await self.collectionRef.document(String(dormRoom.roomNumber)).delete()
                    return true
                }
            }
        }
    }
}
