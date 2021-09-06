//
//  DetailPersonListTVC.swift
//  HW15
//
//  Created by Powroli on 3.07.21.
//

import UIKit

class DetailPersonListTVC: UITableViewController {

    struct Person {
        var name: String
        var surname: String
        var email: String
        var phone: String
    }

    let names = ["George", "Aleksandr",
        "Polina", "Evgeniy",
        "Denis", "Danik",
        "Mary", "Alisa",
        "Liza", "Katya"]
    let surnames = ["Sviridov", "Ivanov",
        "Petrov", "Burunov",
        "Antonov", "Alkhovskiy",
        "Semenov", "Zhuk",
        "Kuzmenko", "Abramovich"]
    let phones = ["+375291739854", "+375295489087",
        "+375257035846", "+375336037211",
        "+375447678219", "+375259314546",
        "+375336789745", "+375296447565",
        "+375447456363", "+375291020173"]
    let emails = ["pussycat95@gmail.com", "antonofff@gmail.com",
        "mail120694@gmail.com", "work310586@gmail.com",
        "kittylover96@gmail.com", "dogsitter@gmail.com",
        "anfuture@gmail.com", "frenk1998@gmail.com",
        "flowergirl@gmail.com", "beautyorg@gmail.com"]
    var persons: [Person] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setTitle()
        createPerson()
        navigationItem.leftBarButtonItem = editButtonItem
    }

    private func createPerson() {
        for _ in 1...10 {
            let person = Person(name: names.randomElement()!, surname: surnames.randomElement()!, email: emails.randomElement()!, phone: phones.randomElement()!)
            persons.append(person)
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return persons.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? DetailCell {
            let fullInfo = persons[indexPath.row]
            cell.phoneLbl.text = fullInfo.phone
            cell.emailLbl.text = fullInfo.email
            return cell
        }
        return UITableViewCell()
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return persons[0].name + " " + persons[0].surname
        case 1:
            return persons[1].name + " " + persons[1].surname
        case 2:
            return persons[2].name + " " + persons[2].surname
        case 3:
            return persons[3].name + " " + persons[3].surname
        case 4:
            return persons[4].name + " " + persons[4].surname
        case 5:
            return persons[5].name + " " + persons[5].surname
        case 6:
            return persons[6].name + " " + persons[6].surname
        case 7:
            return persons[7].name + " " + persons[7].surname
        case 8:
            return persons[8].name + " " + persons[8].surname
        case 9:
            return persons[9].name + " " + persons[9].surname
        default:
            return nil
        }
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }

    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let fullName = persons.remove(at: fromIndexPath.row)
        persons.insert(fullName, at: to.row)
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }

    private func setTitle() {
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "Persons List"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

}
