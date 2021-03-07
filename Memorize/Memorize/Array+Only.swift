//
//  Array+Only.swift
//  Memorize
//
//  Created by Kirill Denisov on 07.03.2021.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
