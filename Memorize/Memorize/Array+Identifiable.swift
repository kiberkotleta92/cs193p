//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Kirill Denisov on 07.03.2021.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for idx in 0..<self.count{
            if self[idx].id == matching.id{
                return idx
            }
        }
        return nil
    }
}
