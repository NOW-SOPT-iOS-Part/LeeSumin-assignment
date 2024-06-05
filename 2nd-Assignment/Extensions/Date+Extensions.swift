//
//  Date+Extensions.swift
//  2nd-Assignment
//
//  Created by 이수민 on 5/9/24.
//

import Foundation

extension Date {
    static func movieDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        return dateFormatter.string(from: Date())
    }
}
