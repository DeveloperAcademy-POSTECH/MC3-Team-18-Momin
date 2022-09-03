//
//  RoomRepositoryTest.swift
//  PodormTests
//
//  Created by JongHo Park on 2022/08/31.
//

@testable import Podorm
import XCTest

final class RoomRepositoryTest: XCTestCase {

    private var roomRepository: RoomRepository!

    override func setUpWithError() throws {
        try super.setUpWithError()
        roomRepository = FirebaseRoomRepository.shared
    }

    override func tearDown() async throws {
        try await roomRepository.removeRooms(DormRoom.mockData)
        try await super.tearDown()
    }

    func testLoadingRoom() async throws {
        try await roomRepository.addRooms(DormRoom.mockData)
        let rooms = try await roomRepository.loadRooms()
        XCTAssertEqual(rooms, DormRoom.mockData)
    }
}
