//
//  RoomManager.swift
//  Podorm
//
//  Created by JongHo Park on 2022/08/26.
//

import SwiftUI

struct RoomManager: View {
    @EnvironmentObject private var appState: AppState
    @Environment(\.injected) private var diContainer: DIContainer

    @State private var floorNumber: DormFloor = .first

    var body: some View {
        VStack {
            content()
        }
        .onAppear(perform: requestDormRooms)
        .navigationTitle("Dorm manager")
        .toolbar {
            ToolbarItem(placement: .principal) {
                control
            }
            ToolbarItem(placement: .automatic) {
                Button("Select") {
                    print("Select")
                }
            }
            ToolbarItem(placement: .automatic) {
                Button("Import") {
                    print("Import")
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }

    enum DormFloor: String, CaseIterable {
        case first = "1F"
        case second = "2F"
        case third = "3F"
        case fourth = "4F"
    }

    // 추후에 데이터 가져올 때 쓰기 위해 일단 만들어놓음
    func switchFloor() {
        switch floorNumber {
        case .first:
            print("1F")
        case .second:
            print("2F")
        case .third:
            print("3F")
        case .fourth:
            print("4F")
        }
    }

    var control: some View {
        Picker("DiCE Floor", selection: $floorNumber) {
            ForEach(DormFloor.allCases, id: \.self) {
                Text($0.rawValue)
            }
        }
        .pickerStyle(.segmented)
        .frame(width: 360)
    }
}

// MARK: - Side Effects {
private extension RoomManager {
    func requestDormRooms() {

    }
}

// MARK: - content
private extension RoomManager {

    @ViewBuilder
    func content() -> some View {
        switch appState.userData.dormRooms {
        case .notRequested:
            EmptyView()
        case .isLoading:
            loading()
        case .loaded(let rooms):
            loaded(rooms)
        case .failed(let error):
            errorIndicator(error)
        }
    }
}

// MARK: - Loading UI
private extension RoomManager {
    func loading() -> some View {
        ProgressView()
            .progressViewStyle(.circular)
            .tint(.postechRed)
            .scaleEffect(2)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
}

// MARK: - Loaded UI
private extension RoomManager {
    func loaded(_ rooms: [DormRoom]) -> some View {
        roomGrid(rooms)
    }

    var lazyColumn: [GridItem] { [GridItem(.adaptive(minimum: 100), spacing: 24)]
    }

    func roomGrid(_ rooms: [DormRoom]) -> some View {
        LazyVGrid(columns: lazyColumn, spacing: 60) {
            ForEach(rooms, id: \.self) { room in
                RoomGridCell(room: room)
            }
        }
        .padding(30)
    }
}

// MARK: - Error UI
private extension RoomManager {
    func errorIndicator(_ error: Error) -> some View {
        Button {
            requestDormRooms()
        } label: {
            Text("An Error occur when loading dorm rooms...\nplease try again")
        }
        .buttonStyle(.bordered)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
}

#if DEBUG
// MARK: - Preview
struct RoomManager_Previews: PreviewProvider {

    static func makePreview(_ roomState: Loadable<[DormRoom]>) -> some View {
        NavigationView {
            EmptyView()
            RoomManager()
        }
        .injectPreview(AppState(AppState.UserData(dormRooms: roomState)))
        .previewInterfaceOrientation(.landscapeLeft)
        .accentColor(.postechRed)
    }

    static var previews: some View {
        Group {
            makePreview(.isLoading(last: nil))
                .previewDisplayName("loading UI")
            makePreview(.loaded(DormRoom.mockData))
                .previewDisplayName("loaded UI")
            makePreview(.failed(NSError()))
                .previewDisplayName("error when loading")
        }
    }
}
#endif
