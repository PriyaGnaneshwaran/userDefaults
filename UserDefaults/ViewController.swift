//
//  ViewController.swift
//  UserDefaults
//
//  Created by Priya Gnaneshwaran on 03/11/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var btnSubmit: UIButton!
    
    let userDefaults = UserDefaults()
    let email = "Email"
    let password = "Password"
    let isLoggedIn = "IsLoggedIn"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Login"
        self.tfEmail.delegate = self
        self.tfPassword.delegate = self
        self.navigationItem.setHidesBackButton(true, animated: true)
        if UserDefaults.standard.bool(forKey: isLoggedIn){
            self.navigateToDetail()
        }
    }
    
    func navigateToDetail(){
        let nav : DetailsController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "DetailsController") as! DetailsController
        self.navigationController?.pushViewController(nav, animated: true)
    }

    func updateUserDefaults(){
        UserDefaults.standard.set(tfEmail.text, forKey: email)
        UserDefaults.standard.set(tfPassword.text, forKey: password)
        UserDefaults.standard.set(true, forKey: isLoggedIn)
        self.navigateToDetail()
    }

    @IBAction func actionSubmit(_ sender: UIButton) {
        if tfEmail.text?.isEmpty == true {
            self.showAlert(title: "Alert", message: "Please Enter Email")
        }else if tfPassword.text?.isEmpty == true{
            self.showAlert(title: "Alert", message: "Please Enter Password")
        }else{
            self.updateUserDefaults()
        }
    }
}

extension ViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension UIViewController {
    func showAlert(title: String , message : String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated : true , completion : nil)
    }
}
