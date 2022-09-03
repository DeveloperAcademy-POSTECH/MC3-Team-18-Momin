//
//  RoomListInteractor.swift
//  Podorm
//
//  Created by JongHo Park on 2022/09/01.
//

protocol RoomListInteractor {
    func requestRooms() async
    func addRooms(_ dormRooms: [DormRoom]) async
    func addRoom(_ dormRoom: DormRoom) async
}

struct RealRoomListInteractor {

    private let roomRepository: RoomRepository
    private let appState: AppState

    init(roomRepository: RoomRepository, appState: AppState) {
        self.roomRepository = roomRepository
        self.appState = appState
    }
}

extension RealRoomListInteractor: RoomListInteractor {

    @MainActor func requestRooms() async {
        do {
            var dormRooms: [DormRoom] = try await roomRepository.loadRooms()
            dormRooms = dormRooms.sorted(by: { first, second in
                first.roomNumber < second.roomNumber
            })
            appState.userData.dormRooms = .loaded(dormRooms)
        } catch {
            appState.userData.dormRooms = .failed(error)
        }
    }

    @MainActor func addRooms(_ dormRooms: [DormRoom]) async {
        do {
            try await roomRepository.addRooms(dormRooms)
            var update = appState.userData.dormRooms.value ?? []
            update.append(contentsOf: dormRooms)
            update = update.sorted { first, second in
                return first.roomNumber < second.roomNumber
            }
            appState.userData.dormRooms = .loaded(update)
        } catch {
            print(error.localizedDescription)
        }
    }

    @MainActor func addRoom(_ dormRoom: DormRoom) async {
        do {
            try await roomRepository.addRoom(dormRoom)
            var update = appState.userData.dormRooms.value ?? []
            update.append(dormRoom)
            update = update.sorted { first, second in
                return first.roomNumber < second.roomNumber
            }
            appState.userData.dormRooms = .loaded(update)
        } catch {
            print(error.localizedDescription)
        }
    }

}
