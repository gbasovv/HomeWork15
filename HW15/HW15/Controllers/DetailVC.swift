//
//  DetailVC.swift
//  HW15
//
//  Created by Powroli on 4.07.21.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var phoneLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!

    var phone: String?
    var email: String?
    var navTitle: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        phoneLbl.text = "Phone number: " + phone!
        emailLbl.text = "Email adress: " + email!
        navigationItem.title = navTitle
    }

}
