//
//  AppState.swift
//  Podorm
//
//  Created by JongHo Park on 2022/08/26.
//

import Foundation

final class AppState: ObservableObject {
    @Published var userData: UserData
    @Published var routing: ViewRouting

    init(_ userData: UserData = UserData(), _ routing: ViewRouting = ViewRouting()) {
        self.userData = userData
        self.routing = routing
    }
}

// MARK: - User data (Like Room, Student
extension AppState {

    struct UserData {
        var dormRooms: Loadable<[DormRoom]>

        init(dormRooms: Loadable<[DormRoom]> = .loaded(DormRoom.mockData)) {
            self.dormRooms = dormRooms
        }
    }

}

// MARK: - Routing
extension AppState {

    struct ViewRouting: Equatable {
    }

}

// MARK: - For Preview
#if DEBUG
extension AppState {
    static var preview: AppState {
        AppState()
    }
}
#endif
