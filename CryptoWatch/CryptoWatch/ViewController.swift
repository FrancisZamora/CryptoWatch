//
//  ViewController.swift
//  CryptoWatch
//
//  Created by Francis Zamora on 1/3/18.
//  Copyright © 2018 Francis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var Crypto = Cryptocurrency(name: "" , price: "", day_percent_change: "", hour_percent_change: "")
    var CryptoCurrencies = [Cryptocurrency]()
    var cryptos = ["Bitcoin","Ripple","Cardano","Tron","Litecoin", "Stellar"]

    override func viewDidLoad() {
        self.fetchCoins()
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func fetchCoins() {
        for x in cryptos {
        APIClient.FetchCurrency(coin:x, onCompletion:   { cryp  in
            print("api")
           
            self.Crypto = cryp[0]
            self.CryptoCurrencies.append(self.Crypto)
            print(self.CryptoCurrencies)
            })

        }
        
    }

    
}

