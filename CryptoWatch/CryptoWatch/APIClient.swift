//
//  APIClient.swift
//  
//
//  Created by Francis Zamora on 1/3/18.
//

import Foundation
import SwiftyJSON
import Alamofire

class APIClient {
    static func FetchCurrency(coin:String, onCompletion: @escaping([Cryptocurrency]) -> Void) {
        Alamofire.request("https://api.coinmarketcap.com/v1/ticker/\(coin)").responseJSON{ response in
            
            guard let jsonString = response.result.value,  let crypto = JSON(jsonString).array   else {
                onCompletion([])
                
                print("ERROR with Coinmarket API")
                return
            }
            print(jsonString)
            print("SUCCESS")
            var cryptoArray = [Cryptocurrency]()
            for x in crypto {
                
                
                if let name = x["name"].string,
                    let price = x["price_usd"].string,
                    let dayChange = x["percent_change_24h"].string,
                    let hourChange = x["percent_change_1h"].string
                  
                {
                    
                    
                    cryptoArray.append(Cryptocurrency(name:  name, price: price, day_percent_change:dayChange,hour_percent_change:hourChange))
                    print(cryptoArray)
                }
                
            }
            onCompletion(cryptoArray)
        }
    }
    
}
    

