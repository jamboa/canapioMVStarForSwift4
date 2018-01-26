//
//  ViewController.swift
//  MVP
//
//  Created by yoojonghyun on 2018. 1. 27..
//  Copyright © 2018년 yoojonghyun. All rights reserved.
//

import UIKit

struct Person {
    let firstName : String
    let lastName : String
}

protocol GreetingView : class {
    func setGreeting(greeting: String)
}

protocol GreetingViewPresenter {
    init(view: GreetingView, person: Person)
    func showGreeting()
}

class GreetingPresenter : GreetingViewPresenter {
    unowned let view : GreetingView
    let person: Person
    required init(view: GreetingView, person: Person) {
        self.view = view
        self.person = person
    }
    
    func showGreeting() {
        let greeting = "hello" + " " + self.person.firstName + " " + self.person.lastName
        self.view.setGreeting(greeting: greeting)
    }
}

class GreetingViewController: UIViewController, GreetingView {
    
    var presenter : GreetingViewPresenter!
    let showGreetingButton = UIButton()
    let greetingLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.showGreetingButton.addTarget(self, action: #selector(self.didTapButton(button:)), for : .touchUpInside)
    }

    func didTapButton(button : UIButton) {
        self.presenter.showGreeting()
    }

    func setGreeting(greeting: String) {
        self.greetingLabel.text = greeting
    }

}

