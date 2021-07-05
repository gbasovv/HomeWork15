//
//  PersonListTVC.swift
//  HW15
//
//  Created by Powroli on 3.07.21.
//

import UIKit

class PersonListTVC: UITableViewController {

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
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let fullName = persons[indexPath.row]
        cell.textLabel?.text = fullName.name + " " + fullName.surname
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow,
            let detailVC = segue.destination as? DetailVC {
            let fullInfo = persons[indexPath.row]
            detailVC.phone = fullInfo.phone
            detailVC.email = fullInfo.email
            detailVC.navTitle = fullInfo.name + " " + fullInfo.surname
        }
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
