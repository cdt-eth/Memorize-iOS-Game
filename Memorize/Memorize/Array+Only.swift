//
//  Array+Only.swift
//  Memorize
//
//  Created by Christian David Turner on 9/25/20.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
