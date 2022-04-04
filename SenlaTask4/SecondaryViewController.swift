//
//  SecondaryViewController.swift
//  SenlaTask4
//
//  Created by Никита Макаревич on 31.03.2022.
//

import Foundation
import UIKit

class SecondaryViewController : UIViewController {
    
    var stackView = UIStackView()
    var diceImage = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 50
        
        configureStackView()
    }
    
    func configureStackView() {
        diceImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        diceImage.image = UIImage(named: "dice6.png")
        stackView.addArrangedSubview(diceImage)
        
        let diceButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        view.addSubview(diceButton)
        diceButton.center = view.center
        diceButton.backgroundColor = .systemPurple
        diceButton.setTitle("ROLL", for: .normal)
        diceButton.addTarget(self, action: #selector(diceButtonPressed), for: .touchUpInside)
        stackView.addArrangedSubview(diceButton)
        
        setStackViewConstraints()
    }
    
    @objc func diceButtonPressed() {
        let array = ["dice1.png", "dice2.png", "dice3.png", "dice4.png", "dice5.png", "dice6.png"]
        diceImage.image = UIImage(named: array.randomElement()!)
        
    }
    
    func setStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -100).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -150).isActive = true
    }
    
    
    
}
