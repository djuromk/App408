//
//  ConvertDate.swift
//  App408
//
//  Created by DJUROM on 03/04/2024.
//

import SwiftUI

extension Date {

    func convertDate(format: String) -> String {
        
        let date = self
        let formatter = DateFormatter()
        
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
}
