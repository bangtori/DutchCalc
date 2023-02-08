//
//  MemberSettingViewController.swift
//  DutchCalc
//
//  Created by 방유빈 on 2023/02/08.
//

import UIKit

class MemberSettingViewController: UIViewController {

    @IBOutlet weak var explanationLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initExplabationLabel()

        // Do any additional setup after loading the view.
    }
    func initExplabationLabel(){
        explanationLabel.text = "중간에 참여하거나, 나간 인원을 포함한 모든 인원을 추가해주세요."
        explanationLabel.lineBreakMode = .byCharWrapping
        explanationLabel.numberOfLines = 0
    }
}
