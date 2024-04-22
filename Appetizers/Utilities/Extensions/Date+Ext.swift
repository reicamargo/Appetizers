//
//  Date+Ext.swift
//  Appetizers
//
//  Created by Reinaldo Camargo on 22/04/24.
//

import Foundation

extension Date {
    var eighteenYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -18, to: Date())!
    }
    
    var oneHundredTenYearsAgor: Date {
        Calendar.current.date(byAdding: .year, value: -110, to: Date())!
    }
}
