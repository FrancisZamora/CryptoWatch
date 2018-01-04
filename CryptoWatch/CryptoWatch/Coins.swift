//
//  Coins.swift
//  CryptoWatch
//
//  Created by Francis Zamora on 1/3/18.
//  Copyright © 2018 Francis. All rights reserved.
//

import Foundation
import UIKit
class Coins:UICollectionViewController {
    
    
    
    var Crypto = Cryptocurrency(name: "" , price: "", day_percent_change: "", hour_percent_change: "")
    var CryptoCurrencies = [Cryptocurrency]()
    var cryptos = ["Bitcoin","Ripple","Cardano","Tron","Litecoin", "Stellar"]
    
    override func viewDidLoad() {
        let screenSize = UIScreen.main.bounds
        
        let size = CGSize(width: screenSize.width / 2, height: screenSize.height / 3.5)
        flow.itemSize = size
        // Setting the space between cells
        
        
        //layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        flow.scrollDirection = .vertical
        flow.minimumInteritemSpacing = 0
        flow.minimumLineSpacing = 0.0
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.fetchCoins()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.CryptoCurrencies = []
        
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
