//
//  SignUpVC.swift
//  CryptoN
//
//  Created by Hilmihan Çalışan on 10.11.2022.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpVC: UIViewController {

   
    @IBOutlet weak var signImageView: UIImageView!
    
    @IBOutlet weak var SignUpLabel: UILabel!
    
    @IBOutlet weak var signEmailText: UITextField!
    
   
    @IBOutlet weak var signPasswordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        signImageView.image = UIImage(named: "login")
        // Do any additional setup after loading the view.
    }
    

    @IBAction func signUpButton(_ sender: Any) {
        
       /* if signEmailText.text?.isEmpty == true {
            print("No Text Email Field")
            return
        }
        
        if signPasswordText.text?.isEmpty == true {
            print("No Text Password Field")
        }
        */
        
        signUp()
        
        
    }
    
    @IBAction func alreadyAccountButton(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SignInVC")
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    
        
    }
    
    
    func signUp() {
        
        Auth.auth().createUser(withEmail: signEmailText.text!, password: signPasswordText.text! ) { aultResult, error in
            guard let user = aultResult?.user, error == nil else {
                
                self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
                return
            }
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "SignInVC")
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
            
        }
    }
    
    
    
    func makeAlert(titleInput:String, messageInput:String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
}
