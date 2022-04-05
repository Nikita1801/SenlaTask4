//
//  MainViewController.swift
//  SenlaTask4
//
//  Created by Никита Макаревич on 31.03.2022.
//

import Foundation
import UIKit

protocol MainVCDelegate : AnyObject{
    func changeRules(mode : Bool)
    var rulesWithoutRepeat : Bool {get set}
}

class MainViewController : UIViewController, MainVCDelegate {

    
    var rulesWithoutRepeat : Bool = false
    var settingsVC = SettingsViewController()
    var stackView = UIStackView()
    var titleLabel = UILabel()
    let options = ["Камень", "Ножницы", "Бумага"]
    var randomItem : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 50
        
        
        configureTitleLabel()
        configureItem()
        configureButtons()
    }
    
    override func viewWillAppear(_ animated: Bool) {
       // print(rulesWithoutRepeat)
    }
    
    func configureButtons() {
        
        let stoneButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        view.addSubview(stoneButton)
        stoneButton.center = view.center
        stoneButton.setImage(UIImage(named: "stoneImage.png"), for: .normal)
        stoneButton.setTitle("Камень", for: .normal)
        stoneButton.addTarget(self, action: #selector(itemButtonPressed), for: .touchUpInside)
        stackView.addArrangedSubview(stoneButton)
        
        let scissorButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        view.addSubview(scissorButton)
        scissorButton.center = view.center
        scissorButton.setImage(UIImage(named: "scissorsImage.png"), for: .normal)
        scissorButton.setTitle("Ножницы", for: .normal)
        scissorButton.addTarget(self, action: #selector(itemButtonPressed), for: .touchUpInside)
        stackView.addArrangedSubview(scissorButton)
        
        let paperButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        view.addSubview(paperButton)
        paperButton.center = view.center
        paperButton.setImage(UIImage(named: "paperImage.png"), for: .normal)
        paperButton.setTitle("Бумага", for: .normal)
        paperButton.addTarget(self, action: #selector(itemButtonPressed), for: .touchUpInside)
        stackView.addArrangedSubview(paperButton)
        
        configureTitleLabel()
        
        setStackViewConstraints()
        
    }
    
    
    @objc func itemButtonPressed(_ sender: AnyObject?) {
        let currentItem = sender?.currentTitle!
        randomItem = options.randomElement()!
        print(rulesWithoutRepeat)
        if (rulesWithoutRepeat) {
            if (randomItem == currentItem) {
                var optionsWithoutRepeat = options
                optionsWithoutRepeat.remove(object: randomItem)
                randomItem = optionsWithoutRepeat.randomElement()!
            }
        }
        
        if (currentItem == "Ножницы" && randomItem == "Бумага") {
            titleLabel.text = "Победа! Противник выбрал бумагу"
        }
        else if (currentItem == "Ножницы"  && randomItem == "Камень"){
            titleLabel.text = "Проигрыш. Противник выбрал камень"
        }
        else if (currentItem == "Бумага" && randomItem == "Камень") {
            titleLabel.text = "Победа! противник выбрал камень"
        }
        else if (currentItem == "Бумага" && randomItem == "Ножницы") {
            titleLabel.text = "Проигрыш. Противник выбрал ножницы"
        }
        else if (currentItem == "Камень" && randomItem == "Ножницы") {
            titleLabel.text = "Победа! Противник выбрал ножницы"
        }
        else if (currentItem == "Камень" && randomItem == "Бумага") {
            titleLabel.text = "Проигрыш. Противник выбрал бумагу"
        }
        else if (currentItem == randomItem) {
            titleLabel.text = "Ничья! Противник думает как ты"
        }
        
    }
    
    func setStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 80).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -80).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -70).isActive = true
    }
    
    private func configureItem() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Settings", style: .done, target: self, action: #selector(didTapButton(_:)))
    }
    @objc func didTapButton(_ sender : UIBarButtonItem!) {
        let settingsVC = SettingsViewController()
        settingsVC.delegate = self
        navigationController?.pushViewController(settingsVC, animated: false)
    }
    
    func configureTitleLabel() {
        stackView.addArrangedSubview(titleLabel)
        titleLabel.text = "Chose your item"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        
    }
}
                
    extension Array where Element: Equatable {
        
        mutating func remove(object: Element) {
            guard let index = firstIndex(of: object) else {return}
            remove(at: index)
            }
    }

extension MainVCDelegate {
    func changeRules(mode: Bool) {
        rulesWithoutRepeat = mode
    }
}
