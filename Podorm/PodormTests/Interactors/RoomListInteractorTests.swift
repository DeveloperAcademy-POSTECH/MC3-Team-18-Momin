//
//  RoomListInteractorTests.swift
//  PodormTests
//
//  Created by JongHo Park on 2022/09/01.
//

@testable import Podorm
import XCTest

final class RoomListInteractorTests: XCTestCase {

    // MARK: - Tests Dependency
    private var roomListInteractor: RoomListInteractor!
    private var appState: AppState!
    private var mockRoomRepository: RoomRepository!

    override func setUp() async throws {
        try await super.setUp()
        appState = .init()
        mockRoomRepository = MockRoomRepository()
        roomListInteractor = RealRoomListInteractor(roomRepository: mockRoomRepository, appState: appState)
    }

    override func tearDown() async throws {
        try await super.tearDown()
        appState = nil
        mockRoomRepository = nil
        roomListInteractor = nil
    }

    func testRequestRooms() async throws {
        try await mockRoomRepository.addRooms(DormRoom.mockData)
        await roomListInteractor.requestRooms()
        XCTAssertEqual(Loadable.loaded(DormRoom.mockData), appState.userData.dormRooms)
    }

    func testAddRoom() async throws {
        try await mockRoomRepository.addRoom(DormRoom.mockData.first!)
        await roomListInteractor.requestRooms()
        XCTAssertEqual(Loadable.loaded([DormRoom.mockData.first!]), appState.userData.dormRooms)
    }

}
