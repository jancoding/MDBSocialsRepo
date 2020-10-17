//
//  ViewController.swift
//  MDBSocials
//
//  Created by Janvi Shah on 10/16/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signupButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        // Do any additional setup after loading the view.
    }
    func setUpElements(){
        Utilities.styleFilledButton(signupButton)
        Utilities.styleHollowButton(loginButton)
        
    }


}

