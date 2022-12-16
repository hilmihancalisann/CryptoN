//
//  HomeVC.swift
//  CryptoN
//
//  Created by Hilmihan Çalışan on 18.11.2022.
//

import UIKit



class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    
    

    @IBOutlet weak var tableView: UITableView!
    
    private var cryptoListVM : CryptoListVM!

    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    
        getData()
        
        
    }
    
    func getData() {
        
        let url = URL(string:"https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
        
        WebService().downloadCurrencies(url: url) { cryptos in
            if let cryptos = cryptos {
                
                self.cryptoListVM = CryptoListVM(cryptoCurrencyList: cryptos)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }
        }
        
    }
    

   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return self.cryptoListVM == nil ? 0 : self.cryptoListVM.numberofRowInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cryptoCell", for: indexPath) as! HomeTVC
        
        let crytoViewModel = self.cryptoListVM.cryptoIndex(indexPath.row)
        cell.priceText.text = crytoViewModel.price
        cell.currencyText.text = crytoViewModel.name
        
        return cell
    }
    

    
}
