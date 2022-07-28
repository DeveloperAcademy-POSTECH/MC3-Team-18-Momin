//
//  DocumentPickerViewModel.swift
//  dorm
//
//  Created by 한택환 on 2022/07/28.
//

import Foundation

final class DocumentPickerViewModel {
    var dormStudentData = [Student]()
    
    func parseCSV(url: URL) -> [Student] {
        //TODO: .csv 파일이 내장되어 있는 경우 임시값
        let path = Bundle.main.path(forResource: "MockData_CSV", ofType: "csv")
        
        var encodedData = ""
        do {
            let data = try Data(contentsOf: url)
            encodedData = String(data: data, encoding: .utf8)!
            
        } catch {
            print(error)
            return []
        }
        
        var csvRows = encodedData.components(separatedBy: "\n")
        let colCount = csvRows.first?.components(separatedBy: "\n").count
        csvRows.removeFirst()
        
        for csvRow in csvRows {
            let csvColumns = csvRow.components(separatedBy: ",")
            if csvColumns.count == colCount {
                let studentEntity = Student.init(Int(csvColumns[0]) ?? 0, csvColumns[1], csvColumns[2], Int(csvColumns[3]) ?? 0, 0)
                dormStudentData.append(studentEntity)
            }
        }
        return dormStudentData
    }
}
