//
//  Cryptocurrency.swift
//  CryptoWatch
//
//  Created by Francis Zamora on 1/3/18.
//  Copyright © 2018 Francis. All rights reserved.
//

import Foundation
import UIKit


class Cryptocurrency {
    var name = " "
    var price = " "
    var day_percent_change = " "
    var hour_percent_change = " "
    init(name:String,price:String,day_percent_change:String,hour_percent_change:String) {
        self.name = name
        self.price = price
        self.day_percent_change = day_percent_change
        self.hour_percent_change = hour_percent_change
    }
    
    
    
}
