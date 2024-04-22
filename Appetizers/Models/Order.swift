//
//  Order.swift
//  Appetizers
//
//  Created by Reinaldo Camargo on 21/04/24.
//

import SwiftUI

final class Order: ObservableObject {
    @Published var items: [Appetizer] = []
    var totalPrice: Double {
        items.reduce(0, { $0 + $1.price })
// newbie version
//        var sum: Double = 0.00
//        items.forEach { appetizer in
//            sum += appetizer.price
//        }
//        return sum
    }
    
    func add(_ appetizer: Appetizer) {
        items.append(appetizer)
    }
    
    func remove(at offSet: IndexSet) {
        items.remove(atOffsets: offSet)
    }
}
