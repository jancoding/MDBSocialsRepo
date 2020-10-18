//
//  LoginViewController.swift
//  MDBSocials
//
//  Created by Janvi Shah on 10/16/20.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    @IBOutlet weak var errorLabel: UILabel!
    
    static var user: User!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        // Do any additional setup after loading the view.
    }
    
    func setUpElements(){
        //hide the errorlabel
        errorLabel.alpha = 0
        
        //style elements
        Utilities.styleTextField(usernameTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(loginButton)
        
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        // TODO: Validate Text Fields
        
        
        let username = usernameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        //Signing in the User
        Auth.auth().signIn(withEmail: username, password: password) { (result, error) in
            if error != nil {
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
            }
            else{
                LoginViewController.user = User(forUser: username, withEmail: (result?.user.email)!, withUID: (result?.user.uid)!)
                let homeviewcontroller = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.HomeViewController) as? HomeViewController
                self.view.window?.rootViewController = homeviewcontroller
                self.view.window?.makeKeyAndVisible()
            }
        }
    }
    

    

}
