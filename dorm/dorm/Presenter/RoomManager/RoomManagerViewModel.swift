//
//  RoomManagerViewModel.swift
//  dorm
//
//  Created by 한택환 on 2022/08/02.
//

import Foundation

final class RoomManagerViewModel {
    var dormStudentData = [Student]()
    var dormStudentDatas = [[Student]]()
    
    func parseCSV(url:URL) -> [[Student]] {
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
        
        for (index, csvRow) in csvRows.enumerated() {
            let csvColumns = csvRow.components(separatedBy: ",")
            //FIXME: .csv파일에 따라 init 매개변수 변경예정 현재는 MockData_CSV.csv 에 따름
            let studentEntity = Student.init(Int(csvColumns[1]) ?? 0, csvColumns[0], csvColumns[0], Int(csvColumns[2]) ?? 0, 0)
            dormStudentData.append(studentEntity)
            if index % 2 != 0 {
                dormStudentDatas.append(dormStudentData)
                dormStudentData = []
            }
        }
        return dormStudentDatas
    }
}
