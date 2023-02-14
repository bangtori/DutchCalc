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
    
    var members = [Member](){
        didSet{
            self.saveMembers()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        initExplabationLabel()
        loadData()
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
        inputTextField.text = ""
        tableView.reloadData()
    }
    func saveMembers(){
        let data = self.members.map{
            [
                "name" : $0.name,
                "price" : $0.price
            ]
        }
        let userDefaults = UserDefaults.standard
        userDefaults.set(data, forKey: "members")
    }
    func loadData(){
        let userDefaults = UserDefaults.standard
        guard let data = userDefaults.object(forKey: "members") as? [[String:Any]] else { return }
        self.members = data.compactMap{
            guard let name = $0["name"] as? String else {return nil}
            guard let price = $0["price"] as? Int else {return nil}
            return Member(name: name, price: price)
        }
    }
}

extension MemberSettingViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return members.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MemberCell", for: indexPath) as? MemberCell else {
            return UITableViewCell()
        }
        let member = self.members[indexPath.row]
        cell.nameLabel.text = member.name
        cell.removeBtn.tag = indexPath.row
        cell.removeBtn.addTarget(self, action: #selector(removeBtnTapped(sender:)), for: .touchUpInside)
        return cell
    }
    @objc func removeBtnTapped(sender: UIButton){
        members.remove(at: sender.tag)
        tableView.reloadData()
    }
}

