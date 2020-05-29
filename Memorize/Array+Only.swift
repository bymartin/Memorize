//
//  Array+Only.swift
//  Memorize
//
//  Created by Barry Martin on 5/29/20.
//  Copyright © 2020 Barry Martin. All rights reserved.
//

import Foundation

extension Array  {
    var only: Element? {
        count == 1 ? first : nil
    }
}
