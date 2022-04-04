//
//  SettingsViewController.swift
//  SenlaTask4
//
//  Created by Никита Макаревич on 31.03.2022.
//

import Foundation
import UIKit


class SettingsViewController : ViewController {
    weak var delegate : MainViewController?
    
    var stackView = UIStackView()
    var titleLabel = UILabel()
    var switchRules = UISwitch()
    
    var languageEN = false
    var rulesWithoutRepeat = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Settings"
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        configureSwitches()
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        if (switchRules.isOn) {
            rulesWithoutRepeat = UserDefaults.standard.bool(forKey: "switchState")
            print(rulesWithoutRepeat)
        }
    }
    
    func configureSwitches() {
        
        configureTitleLabel()
        
        let switchLanguage = UISwitch(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        switchLanguage.center = view.center
        switchLanguage.addTarget(self, action: #selector(switchLanguageDidTaped(_:)), for: .valueChanged)
        
        stackView.addArrangedSubview(switchLanguage)
        
        
        switchRules = UISwitch(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        switchRules.center = view.center
        switchRules.addTarget(self, action: #selector(switchRulesDidTaped(_:)), for: .valueChanged)
        stackView.addArrangedSubview(switchRules)
        
        
        
        setStackViewConstraints()
    }
    
    func setStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 80).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -80).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -350).isActive = true
    }
    
    func configureLabel() {
        let languageLabel = UILabel(frame: CGRect(x: 0 , y: 0, width: 200, height: 21))
        languageLabel.center = self.view.center
        languageLabel.textAlignment = .center
        languageLabel.text = "Choose your language and game rules"
        stackView.addArrangedSubview(languageLabel)
        self.view.addSubview(languageLabel)
    }
    func configureTitleLabel() {
        stackView.addArrangedSubview(titleLabel)
        titleLabel.text = "Choose your language and game rules"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        
    }
    
    @objc func switchLanguageDidTaped(_ sender : UISwitch!) {
        if (sender.isOn) {
            print("EN")
        }
        else {
            print("RU")
        }
    }
    
    @objc func switchRulesDidTaped(_ sender : UISwitch!) {
        if (sender.isOn) {
            print("Without repeat")
            rulesWithoutRepeat = true
            UserDefaults.standard.set(sender.isOn, forKey: "switchState")
            }
        else {
            print("With repeat")
        }
    }
}

extension SettingsViewController{
    @objc func switchDidTaped(_ sender : UISwitch!) {
        
    }
    
    
}
