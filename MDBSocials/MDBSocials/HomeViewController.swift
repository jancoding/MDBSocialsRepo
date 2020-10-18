//
//  HomeViewController.swift
//  MDBSocials
//
//  Created by Janvi Shah on 10/16/20.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var detail: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func detail(_ sender: Any) {
        performSegue(withIdentifier: "detail", sender: self)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
