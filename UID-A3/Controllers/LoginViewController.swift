//
//  LoginViewController.swift
//  UID-A3
//
//  Created by Conner Henry on 2018-11-14.
//  Copyright © 2018 Conner Henry. All rights reserved.
//

import UIKit

public class LoginViewController: UIViewController {
    
    // MARK: - Username Controls
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var usernameTxtField: CustomTextField!
    @IBOutlet weak var usernameErrorLbl: UILabel!
    // MARK: - Password Controls
    @IBOutlet weak var passwordLbl: UILabel!
    @IBOutlet weak var passwordTxtField: CustomTextField!
    @IBOutlet weak var passwordErrorLbl: UILabel!
    
    // MARK: - Button Controls
    
    @IBOutlet weak var signInBtn: CustomButton!
    @IBOutlet weak var btnActivityIndicator: UIActivityIndicatorView!
    
    fileprivate var usernameValid: Bool {
        return !(usernameTxtField?.text?.isEmpty ?? true)
    }
    
    fileprivate var passwordValid: Bool {
        return !(passwordTxtField?.text?.isEmpty ?? true)
    }
    
    public override func viewDidLoad() {
        usernameErrorLbl.alpha = 0.0
        passwordErrorLbl.alpha = 0.0
        
        usernameTxtField.delegate = self
        passwordTxtField.delegate = self
        
        usernameTxtField.titleLbl = usernameLbl
        passwordTxtField.titleLbl = passwordLbl
        
        btnActivityIndicator.stopAnimating()
    }
    
    @IBAction func onSignInClick(_ sender: Any?) {
        // Show user name error
        usernameTxtField.error(on: !usernameValid)
        usernameErrorLbl.blink(on: !usernameValid)
        // Show password error
        passwordTxtField.error(on: !passwordValid)
        passwordErrorLbl.blink(on: !passwordValid)
        
        usernameTxtField.resignFirstResponder()
        passwordTxtField.resignFirstResponder()
        // Login
        if usernameValid && passwordValid {
            self.signInBtn.setTitleColor(UIColor.clear, for: .normal)
            self.btnActivityIndicator.startAnimating()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.25) {
                self.signInBtn.setTitleColor(UIColor.white, for: .normal)
                self.btnActivityIndicator.stopAnimating()
                
                UIView.animate(withDuration: 0.25, animations: {
                    self.view.alpha = 0.0
                }, completion: { _ in
                    self.performSegue(withIdentifier: "homePageSegue", sender: nil)
                })
            }
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string == "\n" {
            textField.resignFirstResponder()
            if textField === usernameTxtField {
                passwordTxtField.becomeFirstResponder()
            }
            else {
                onSignInClick(nil)
            }
            
            return false
        }
        
        return true
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        if textField === usernameTxtField && usernameTxtField.hasError != !usernameValid {
            usernameTxtField.error(on: !usernameValid)
            usernameErrorLbl.blink(on: !usernameValid)
        }
        else if textField === passwordTxtField && passwordTxtField.hasError != !passwordValid {
            passwordTxtField.error(on: !passwordValid)
            passwordErrorLbl.blink(on: !passwordValid)
        }
    }
}
