//
//  APICaller.swift
//  CryptoN
//
//  Created by Hilmihan Çalışan on 14.12.2022.
//

import Foundation




final class APICaller {
    static let shared = APICaller()
    
    var countryList : Array<Crypto> = Array()
    private struct Constrants {
        
        static let apikey = "36AF02FE-9665-4995-9A3B-A8196DC9D8B3"
        static let assetsEndPoint = "https://rest-sandbox.coinapi.io/v1/assets/"
    }
    
    private init() {}


    public func getAllCryptoData(completion: @escaping (Result< [Crypto], Error>) -> Void) {
        
        guard let url = URL(string: Constrants.assetsEndPoint + "apikey=" + Constrants.apikey) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {data, _, error in
            
            guard let data = data, error == nil  else {
                return
            }
            do {
                //Decode response
                let cryptos = try JSONDecoder().decode(Crypto.self, from: data)
 
                print(cryptos.name,"")
                
                completion(.success(self.countryList))
                
            }

            catch {
                completion(.failure(error))
                
            }
            
            
        }
       
        task.resume()
    }


    

}


