//
//  VehicleDetailViewController.swift
//  South
//
//  Created by Michel dos Santos on 06/06/21.
//

import UIKit
import Lottie

class VehicleDetailViewController: UIViewController {
    
    private lazy var brandLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont(name: "AvenirNext-Bold", size: 22)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var modelLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont(name: "AvenirNext-Bold", size: 22)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var modeyearlLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont(name: "AvenirNext-Bold", size: 22)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var consultationDate: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .blue
        label.font = UIFont(name: "AvenirNext-Bold", size: 22)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var ValuelLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .red
        label.font = UIFont(name: "AvenirNext-Bold", size: 28)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private let vAnimation: AnimationView = {
        let animationView = AnimationView()
        animationView.translatesAutoresizingMaskIntoConstraints = false
        
        
        return animationView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupConstraints()
     

    }
    
    private func setupConstraints() {
        
        view.addSubview(brandLabel)
        view.addSubview(vAnimation)
        view.addSubview(modelLabel)
        view.addSubview(modeyearlLabel)
        view.addSubview(ValuelLabel)
        view.addSubview(consultationDate)
        title = "Detalhes do Veículo"
        self.navigationController?.navigationBar.barTintColor = .white

        NSLayoutConstraint.activate([
            self.vAnimation.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 120),
            self.vAnimation.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            self.vAnimation.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            
        ])
        
        NSLayoutConstraint.activate([
            self.brandLabel.topAnchor.constraint(equalTo: self.vAnimation.bottomAnchor, constant: 8),
            self.brandLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            self.brandLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            
        ])
        
        NSLayoutConstraint.activate([
            self.modelLabel.topAnchor.constraint(equalTo: self.brandLabel.bottomAnchor, constant: 8),
            self.modelLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            self.modelLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            
        ])
        
        NSLayoutConstraint.activate([
            self.modeyearlLabel.topAnchor.constraint(equalTo: self.modelLabel.bottomAnchor, constant: 8),
            self.modeyearlLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            self.modeyearlLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            
        ])
        
        NSLayoutConstraint.activate([
            self.ValuelLabel.topAnchor.constraint(equalTo: self.consultationDate.bottomAnchor, constant: 8),
            self.ValuelLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            self.ValuelLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            
        ])
        
        NSLayoutConstraint.activate([
            self.consultationDate.topAnchor.constraint(equalTo: self.modeyearlLabel.bottomAnchor, constant: 8),
            self.consultationDate.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            self.consultationDate.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            
        ])
        
        vAnimation.play()
        
    }
    
    func setupView(vehicle: VehicleModel, typeVehicle: Vehicle) {
        guard let brand = vehicle.marca else { return }
        guard let model = vehicle.modelo else { return }
        guard let year = vehicle.anoModelo else { return }
        guard let date = vehicle.mesReferencia else { return }
        guard let value = vehicle.valor else { return }
        
        
        brandLabel.text = "MARCA: \(brand)"
        modelLabel.text = "Modelo: \(model)"
        modeyearlLabel.text = "ANO: \(year	)"
        ValuelLabel.text = "Valor R$ \(value)"
        consultationDate.text = "Data da conculta: \(date)"
        
       setupAnimation(vehicle: typeVehicle)
   }
    
    
    private func setupAnimation(vehicle: Vehicle){
        var nameAnimation = ""
        
        switch vehicle {
        case .car:
            nameAnimation = "car"
        case .motorcycle:
            nameAnimation = "motorcycle"
        case .truck:
            nameAnimation = "truck2"
        }
        
        let animation = Animation.named(nameAnimation)
        vAnimation.animation = animation
        vAnimation.heightAnchor.constraint(equalToConstant: 200).isActive = true
        vAnimation.widthAnchor.constraint(equalToConstant: 200).isActive = true
        vAnimation.contentMode = .scaleAspectFit
        vAnimation.loopMode = .loop
    }

}
