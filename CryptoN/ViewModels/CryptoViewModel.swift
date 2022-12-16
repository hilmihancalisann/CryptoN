//
//  CryptoViewModel.swift
//  CryptoN
//
//  Created by Hilmihan Çalışan on 15.12.2022.
//

import Foundation


struct CryptoListVM {
    
    let cryptoCurrencyList : [CryptoCurrency]
    
    func numberofRowInSection() -> Int {
        
        return self.cryptoCurrencyList.count
        
    }
    
    func cryptoIndex(_ index: Int) -> CryptoVM {
        
        let crypto = self.cryptoCurrencyList[index]
        return CryptoVM(cryptoCurency: crypto)
    }
    
}


struct CryptoVM {
    
    let cryptoCurency : CryptoCurrency
    
    var name : String {
        
        return self.cryptoCurency.currency
    }
    
    var price : String {
        
        return self.cryptoCurency.price
    }
}
