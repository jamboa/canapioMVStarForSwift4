//
//  mvvm.swift
//  mvvm
//
//  Created by yoojonghyun on 2018. 1. 27..
//  Copyright © 2018년 yoojonghyun. All rights reserved.
//

import UIKit

struct Person {
    let firstName: String
    let lastName : String
}

protocol GreetingViewModelProtocol : class {
    var greeting : String? { get }
    var greetingDidChange : ((GreetingViewModelProtocol) -> ())? {get set}
    init(person : Person)
    func showGreeting()
}


class GreetingViewModel : GreetingViewModelProtocol {
    let person:Person
    var greeting: String? {
        didSet {
            self.greetingDidChange?(self)
        }
    }
    var greetingDidChange: ((GreetingViewModelProtocol) -> ())?
    required init(person: Person) {
        self.person = person
    }
    func showGreeting() {
        self.greeting = "Hello" + " " + self.person.firstName + " " + self.person.lastName
    }
}

class GreetingViewController:UIViewController {
    var viewModel : GreetingViewModelProtocol! {
        didSet {
            self.viewModel.greetingDidChange = { [unowned self] viewModel in
                self.greetingLabel.text = viewModel.greeting
            }
        }
    }
    let showGreetingButton = UIButton()
    let greetingLabel = UILabel()
    
    @objc func type() {
        self.viewModel.showGreeting()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showGreetingButton.addTarget(self, action: #selector(self.type), for: .touchUpInside)
    }
    
    
}
