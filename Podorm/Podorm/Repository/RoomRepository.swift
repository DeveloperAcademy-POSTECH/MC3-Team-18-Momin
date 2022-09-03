//
//  RoomRepository.swift
//  Podorm
//
//  Created by JongHo Park on 2022/08/31.
//

protocol RoomRepository {
    func addRooms(_ dormRooms: [DormRoom]) async throws
    func addRoom(_ dormRoom: DormRoom) async throws
    func loadRooms() async throws -> [DormRoom]
    func removeRooms(_ dormRooms: [DormRoom]) async throws
    func addStudentToRoom(_ studentId: Int, to dormRoom: DormRoom) async throws
    func removeStudentFromRoom(_ studentId: Int, from dormRoom: DormRoom) async throws
}
