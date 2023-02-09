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
    @IBOutlet weak var tableView: UITableView!
    
    var members:[Member]=[]
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
    @IBAction func addMember(_ sender: UIButton) {
        let name = inputTextField?.text
        members.append(Member(name: name!, price: 0))
        print(members)
        tableView.reloadData()
    }
}

extension MemberSettingViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return members.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemberCell", for: indexPath)
        let member = self.members[indexPath.row]
        cell.textLabel?.text = member.name
        return cell
    }
    
}
