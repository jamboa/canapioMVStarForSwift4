//
//  ViewController.swift
//  MVC
//
//  Created by yoojonghyun on 2018. 1. 27..
//  Copyright © 2018년 yoojonghyun. All rights reserved.
//

import UIKit

struct Person {
    var firstName : String
    var lastName : String
}


class GreetingViewController: UIViewController {
    
    var person: Person!
    let showGreetingButton = UIButton()
    let greetingLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.showGreetingButton.addTarget(self, action: #selector(self.didTapButton(button:)), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        showGreetingButton.backgroundColor = UIColor(displayP3Red: 0.4, green: 0.4 , blue: 0.1, alpha: 20)
        showGreetingButton.frame = CGRect(x: 10, y: 10, width: 100, height: 100)
        person = Person(firstName: "www", lastName: "ddd")
        
        self.view.addSubview(showGreetingButton)
    }
    
    @objc func didTapButton(button: UIButton) {
        let greeting = "Hello" + " " + self.person.firstName + " " + self.person.lastName
        self.greetingLabel.text = greeting
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

