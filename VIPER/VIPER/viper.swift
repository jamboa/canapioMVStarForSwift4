//
//  viper.swift
//  VIPER
//
//  Created by yoojonghyun on 2018. 1. 27..
//  Copyright © 2018년 yoojonghyun. All rights reserved.
//

import UIKit

struct Person {
    let firstName : String
    let lastName : String
}

struct GreetingData {
    let greeting : String
    let subject : String
}

protocol GreetingProvider {
    func provideGreetingData()
}

protocol GreetingOutput: class {
    func receiveGreetingData(greetingData: GreetingData)
}


class GreetingInteractor : GreetingProvider {
    weak var output: GreetingOutput!
    
    func provideGreetingData() {
        let person = Person(firstName: "jonghyun", lastName: "Yoo")
        let subject = person.firstName + " " + person.lastName
        let greeting = GreetingData(greeting: "Heeelo", subject: subject)
        self.output.receiveGreetingData(greetingData: greeting)
    }
    
    
}

protocol GreetingViewEventHandler {
    func didTapShowGreetingButton()
}

protocol GreetingView: class {
    func setGreeting(greeting: String)
}

class GreetingPresenter : GreetingOutput, GreetingViewEventHandler {
    weak var view : GreetingView!
    var greetingProvider : GreetingProvider!
    
    func didTapShowGreetingButton() {
        self.greetingProvider.provideGreetingData()
    }
    
    func receiveGreetingData(greetingData: GreetingData) {
        let greeting = greetingData.greeting + " " + greetingData.subject
        self.view.setGreeting(greeting: greeting)
    }
}


class GreetingViewController : UIViewController, GreetingView {
    var eventHandler: GreetingViewEventHandler!
    let showGreetingButton = UIButton()
    let greetingLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showGreetingButton.addTarget(self, action: #selector(self.didTapButton(button:)), for: .touchUpInside)
    }
    
    @objc func didTapButton(button: UIButton) {
        self.eventHandler.didTapShowGreetingButton()
    }
    
    func setGreeting(greeting: String) {
        self.greetingLabel.text = greeting
    }
}





















