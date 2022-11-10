//
//  LoginVC.swift
//  CryptoN
//
//  Created by Hilmihan Çalışan on 10.11.2022.
//

import UIKit
import Firebase
import FirebaseAuth


class LoginVC: UIViewController {

    
    @IBOutlet weak var loginImageView: UIImageView!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var loginEmailText: UITextField!
    @IBOutlet weak var loginPasswordText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginImageView.image = UIImage(named: "login")
        // Do any additional setup after loading the view.
    }
    

    @IBAction func loginButtonClicked(_ sender: Any) {
        
        signIn()
    }
    
    @IBAction func createAcountButton(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SignUpVC")
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    
    
    func signIn() {
        
        Auth.auth().signIn(withEmail: loginEmailText.text! , password: loginPasswordText.text!) { [weak self] aultResult, err in
            guard let strongself = self else {return}
            if let err = err {
                self?.Alert(titleInput: "Error", messageInput: err.localizedDescription )
            }
            self?.checkUser()
        }
    }
    
    func checkUser() {
        if Auth.auth().currentUser != nil {
            print(Auth.auth().currentUser?.uid)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "homeVC")
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
            
            
        }
    }
    
    
    
    func Alert(titleInput:String, messageInput:String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    
}
