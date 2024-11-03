//
//  DetailsController.swift
//  UserDefaults
//
//  Created by Priya Gnaneshwaran on 03/11/24.
//

import UIKit

class DetailsController: UIViewController {

    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var btnChangePassword: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Details"
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.saveUserDefaultDetails()
    }
    

  func saveUserDefaultDetails() {
      tfEmail.text = UserDefaults.standard.string(forKey: "Email")
      tfPassword.text = UserDefaults.standard.string(forKey: "Password")
    }

    @IBAction func actionChangePassword(_ sender: UIButton) {
        let nav : ChangePasswordController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ChangePasswordController")as! ChangePasswordController
        nav.currentPassword = UserDefaults.standard.string(forKey: "Password") ?? ""
        self.navigationController?.pushViewController(nav, animated: true)
    }
}
