//
//  ChangePasswordController.swift
//  UserDefaults
//
//  Created by Priya Gnaneshwaran on 03/11/24.
//

import UIKit

class ChangePasswordController : UIViewController {
    
    @IBOutlet weak var tfCurrentPassword: UITextField!
    @IBOutlet weak var tfNewPassword: UITextField!
    @IBOutlet weak var tfConfirmPassword: UITextField!
    
    var currentPassword : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Change Password"
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.tfCurrentPassword.text = currentPassword
    }
    
    @IBAction func actionSubmit(_ sender: UIButton) {
        guard let newPassword = tfNewPassword.text, !newPassword.isEmpty else {
            self.showAlert(title: "Alert", message: "Please enter new password")
            return
        }
        guard let confirmPassword = tfConfirmPassword.text ,!confirmPassword.isEmpty else {
            self.showAlert(title: "Alert", message: "Please enter confirm password")
            return
        }
        
        if newPassword != confirmPassword {
            self.showAlert(title: "Alert", message: "New Password and Confirm Password should be same")
            return
        }
        
        UserDefaults.standard.value(forKey: "Password")
        if let viewControllers = self.navigationController?.viewControllers {
            for controller in viewControllers {
                if let loginController = controller as? ViewController {
                    loginController.tfEmail.text = ""
                    loginController.tfPassword.text = ""
                    self.navigationController?.popToViewController(loginController, animated: true)
                    return
                }
            }
        }
        
    }
    
}


