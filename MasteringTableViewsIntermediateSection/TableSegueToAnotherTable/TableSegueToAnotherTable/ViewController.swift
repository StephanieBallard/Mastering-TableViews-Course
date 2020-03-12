//
//  ViewController.swift
//  TableSegueToAnotherTable
//
//  Created by Stephanie Ballard on 3/11/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

// Object Oriented Programming

struct Person {
    var name: String
    var friends: [Person]
}

class ViewController: UIViewController {
    
    var people = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let john = Person(name: "John", friends: [])
        let ben = Person(name: "Ben", friends: [john])
        let tom = Person(name: "Tom", friends: [ben, john])
        let richard = Person(name: "Richard", friends: [john, ben, tom])
        
        people.append(john)
        people.append(ben)
        people.append(tom)
        people.append(richard)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dest = segue.destination as? SecondViewController,
            let indexPath = sender as? IndexPath
        else { return }
        dest.person = people[indexPath.row]
        }
    }

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "firstTableCell", for: indexPath)
        cell.textLabel?.text = people[indexPath.row].name
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "firstToSecondSegue", sender: indexPath)
    }
}
