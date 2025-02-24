//
//  DateFormatter.swift
//  Remember
//
//  Created by Louis Teilliais on 07/02/2025.
//

import Foundation

extension DateFormatter {
    static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        return formatter
    }
}
