//
//  RoomManagerViewModel.swift
//  dorm
//
//  Created by 한택환 on 2022/08/02.
//

import Foundation

final class RoomManagerViewModel {
    @Published private (set) var currentSelectedDormRoom: DormRoom?
    var dormStudentData = [Student]()

    func parseCSV(url: URL) -> [Student] {
        dormStudentData = []
        var encodedData = ""
        do {
            let data = try Data(contentsOf: url)
            encodedData = String(data: data, encoding: .utf8) ?? "error"
        } catch {
            print(error)
            return []
        }

        var csvRows = encodedData.components(separatedBy: "\n")

        csvRows.removeFirst()
        for csvRow in csvRows {
            let csvColumns = csvRow.components(separatedBy: ",")
            let studentEntity = Student.init(Int(csvColumns[1]) ?? 0, csvColumns[0], csvColumns[0], Int(csvColumns[2]) ?? 0, 0)
            // FIXME: .csv파일에 따라 init 매개변수 변경예정 현재는 MockData_CSV.csv 에 따름
            dormStudentData.append(studentEntity)
        }
        return dormStudentData
    }

    func changeDormRoom(_ dormRoom: DormRoom) {
        if currentSelectedDormRoom?.roomNumber == dormRoom.roomNumber {
            currentSelectedDormRoom = nil
        } else {
            currentSelectedDormRoom = dormRoom
        }
    }
}
