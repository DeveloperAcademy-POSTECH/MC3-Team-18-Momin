//
//  MockRoomRepository.swift
//  PodormTests
//
//  Created by JongHo Park on 2022/09/01.
//

@testable import Podorm

final class MockRoomRepository: RoomRepository {

    private var dormRooms: [DormRoom] = []

    func addRooms(_ dormRooms: [Podorm.DormRoom]) async throws {
        self.dormRooms.append(contentsOf: dormRooms)
    }

    func addRoom(_ dormRoom: Podorm.DormRoom) async throws {
        self.dormRooms.append(dormRoom)
    }

    func loadRooms() async throws -> [Podorm.DormRoom] {
        return dormRooms
    }

    func removeRooms(_ dormRooms: [Podorm.DormRoom]) async throws {
    }

    func addStudentToRoom(_ studentId: Int, to dormRoom: Podorm.DormRoom) async throws {
        guard let index = dormRooms.firstIndex(of: dormRoom) else {
            return
        }
        var currentMembers = dormRoom.currentMembers
        currentMembers.append(studentId)
        let add: DormRoom = DormRoom(dormRoom.roomNumber, dormRoom.maxNumber, currentMembers)
        dormRooms[index] = add
    }

    func removeStudentFromRoom(_ studentId: Int, from dormRoom: Podorm.DormRoom) async throws {
        guard let index = dormRooms.firstIndex(of: dormRoom) else {
            return
        }
        var currentMembers = dormRoom.currentMembers
        currentMembers.removeAll { id in
            id == studentId
        }
        dormRooms[index] = DormRoom(dormRoom.roomNumber, dormRoom.maxNumber, currentMembers)
    }

}
