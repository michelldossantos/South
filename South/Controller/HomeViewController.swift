//
//  HomeViewController.swift
//  South
//
//  Created by Michel dos Santos on 04/06/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    private lazy var homeView: HomeView = {
        let view = HomeView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 60))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view.addSubview(homeView)
        title = "Tabela Fipe South System"
        
        homeView.anchor( top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
    }
}

extension HomeViewController : HomeViewDelegate {
    func pressButtonCar() {
        print("Print Carro")
    }
    
    func pressButtonMotorcycle() {
        print("Print Moto")
    }
    
    func pressButtonTruck() {
        print("Print Caminhao")
    }
}
