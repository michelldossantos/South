//
//  HomeView.swift
//  South
//
//  Created by Michel dos Santos on 04/06/21.
//

import UIKit
import Lottie

protocol HomeViewDelegate: NSObject {
    func pressButtonCar()
    func pressButtonMotorcycle()
    func pressButtonTruck()
}

class HomeView: UIView {
    
    
    //MARK: ===========Properties==================
    
    weak var delegate: HomeViewDelegate?
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .blue
        label.font = .systemFont(ofSize: 30)
        label.text = "Escolha o tipo de Veículo"
        label.textAlignment = .center
        return label
    }()
    
    private let carAnimation: AnimationView = {
        let animationView = AnimationView()
        animationView.translatesAutoresizingMaskIntoConstraints = false
        
        let animation = Animation.named("car")
        animationView.animation = animation
        animationView.heightAnchor.constraint(equalToConstant: 160).isActive = true
        animationView.widthAnchor.constraint(equalToConstant: 160).isActive = true
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        return animationView
    }()
    
    private let motorcycleAnimation: AnimationView = {
        let animationView = AnimationView()
        animationView.translatesAutoresizingMaskIntoConstraints = false
        let animation = Animation.named("motorcycle")
        animationView.animation = animation
        animationView.heightAnchor.constraint(equalToConstant: 160).isActive = true
        animationView.widthAnchor.constraint(equalToConstant: 160).isActive = true
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        return animationView
    }()
    
    private let truckAnimation: AnimationView = {
        let animationView = AnimationView()
        animationView.translatesAutoresizingMaskIntoConstraints = false
        let animation = Animation.named("truck2")
        animationView.animation = animation
        animationView.heightAnchor.constraint(equalToConstant: 210).isActive = true
        animationView.widthAnchor.constraint(equalToConstant: 160).isActive = true
        animationView.contentMode = .scaleAspectFill
        animationView.loopMode = .loop
        return animationView
    }()
    
    lazy var carButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 13
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Carros", for: .normal)
        button.tintColor = .black
        button.titleLabel?.font = .systemFont(ofSize: 25 )
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(pressbuttonCar), for: .touchUpInside)
        return button
    }()
    
    lazy var motorcycleButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 13
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Motos", for: .normal)
        button.tintColor = .black
        button.titleLabel?.font = .systemFont(ofSize: 25 )
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(pressbuttonMotorcycle), for: .touchUpInside)

        return button
    }()
    
    lazy var truckButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 13
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Caminhões", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25 )
        button.backgroundColor = .magenta
        button.addTarget(self, action: #selector(pressbuttonTruck), for: .touchUpInside)

        return button
    }()
    
    
    //MARK: =================== Init ===================
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.configurarView()
        self.configurarConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configurarView()
    }
    
    //MARK: ============== Setup ===================
    
    private func configurarView() {
        self.backgroundColor = .white
    }
    
    private func configurarConstraints() {
        addSubview(titleLabel)
        addSubview(carAnimation)
        addSubview(motorcycleAnimation)
        addSubview(truckAnimation)
        addSubview(carButton)
        addSubview(motorcycleButton)
        addSubview(truckButton)
        
        titleLabel.anchor(top: safeAreaLayoutGuide.topAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 16)
        
        carAnimation.anchor(top: titleLabel.bottomAnchor, left: leftAnchor, paddingTop: 16, paddingLeft: 8)
        carButton.anchor( left: carAnimation.rightAnchor, right: rightAnchor, paddingLeft: 8, paddingRight: 8, height: 85)
        carButton.centerY(inView: carAnimation)
        
        motorcycleAnimation.anchor(top: carAnimation.bottomAnchor, left: leftAnchor, paddingTop: 16, paddingLeft: 8)
        motorcycleButton.anchor( left: motorcycleAnimation.rightAnchor, right: rightAnchor, paddingLeft: 8, paddingRight: 8, height: 85)
        motorcycleButton.centerY(inView: motorcycleAnimation)
        
        truckAnimation.anchor(top: motorcycleAnimation.bottomAnchor, left: leftAnchor, paddingTop: 12, paddingLeft: 8)
        truckButton.anchor( left: truckAnimation.rightAnchor, right: rightAnchor, paddingLeft: 8, paddingRight: 8, height: 85)
        truckButton.centerY(inView: truckAnimation)
        
        carAnimation.play()
        motorcycleAnimation.play()
        truckAnimation.play()
    }
    
    //MARK: ============ Methods =============
    
    @objc func pressbuttonCar() {
        delegate?.pressButtonCar()
    }
    
    @objc func pressbuttonMotorcycle() {
        delegate?.pressButtonMotorcycle()
    }
    
    @objc func pressbuttonTruck() {
        delegate?.pressButtonTruck()
    }

}
