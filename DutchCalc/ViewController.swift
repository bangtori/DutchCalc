//
//  ViewController.swift
//  DutchCalc
//
//  Created by 방유빈 on 2023/02/06.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //border 없애기
        logoImageView.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        logoImageView.layer.borderWidth = 5
    }
}

