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
    
    @IBOutlet var flow: UICollectionViewFlowLayout!
    
    
    var Crypto = Cryptocurrency(name: "" , price: "", day_percent_change: "", hour_percent_change: "")
    var CryptoCurrencies = [Cryptocurrency]()
    var cryptos = ["Bitcoin":(#imageLiteral(resourceName: "BTC.png"),0.23),"Ripple":(#imageLiteral(resourceName: "ripple.png"),74),"Cardano":(#imageLiteral(resourceName: "cardano.png"),261.75),"TRON":(#imageLiteral(resourceName: "tron.png"),484.5),"Litecoin":(#imageLiteral(resourceName: "LTC.png"),1.0637),"Stellar":(#imageLiteral(resourceName: "Stellar.png"),0.0)]
    
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
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Coin", for: indexPath) as! Coin
        let x = CryptoCurrencies[indexPath.row].day_percent_change
        let y = CryptoCurrencies[indexPath.row].hour_percent_change
        if x[x.startIndex] == "-" {
            cell.day.textColor = UIColor.red
        }
        else {
            cell.day.textColor = UIColor.green
        }
        if y[x.startIndex] == "-" {
            cell.hour.textColor = UIColor.red
        }
        else {
            cell.hour.textColor = UIColor.green
        }
        let name = CryptoCurrencies[indexPath.row].name
        cell.price.text = "$" + CryptoCurrencies[indexPath.row].price
        let currentPrice = Double(CryptoCurrencies[indexPath.row].price)!
        
        cell.hodl.text = "$" + String(cryptos[name]!.1 * currentPrice)
        cell.CoinPic.image = cryptos[name]?.0
        cell.hour.text = y + "%"
        cell.day.text = x + "%"
        
        
        return cell
        
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return CryptoCurrencies.count
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
        for (x,y) in cryptos {
            APIClient.FetchCurrency(coin:x, onCompletion:   { cryp  in
                print("api")
                
                self.Crypto = cryp[0]
                self.CryptoCurrencies.append(self.Crypto)
                print(self.CryptoCurrencies)
                self.collectionView?.reloadData()
            })
            
        }
        
    }
}
