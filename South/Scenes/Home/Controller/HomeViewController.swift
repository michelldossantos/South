//
//  HomeViewController.swift
//  South
//
//  Created by Michel dos Santos on 04/06/21.
//

import UIKit

enum Vehicle {
    case car
    case motorcycle
    case truck
}

class HomeViewController: UIViewController {
    
    private var viewmodel: HomeViewModel?
    
    private lazy var activeIndicator: UIActivityIndicatorView = {
        let aI = UIActivityIndicatorView()
        aI.center = view.center
        aI.hidesWhenStopped = true
        aI.style = .large
        aI.color = .blue
        view.addSubview(aI)
        
        return aI
        
    }()
    
    private lazy var homeView: HomeView = {
        let view = HomeView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 60))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewmodel = HomeViewModel()
        view.addSubview(homeView)
        title = "Tabela Fipe South System"
        
        homeView.anchor( top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.barTintColor = .white
        homeView.playAnimation()
    }
}
extension HomeViewController {
    
    func goToListBrands(_ vehicle: Vehicle, _ navigationTitle: String) {
        activeIndicator.startAnimating()
        viewmodel?.getListVehicle(vehicle, onComplete: { listVehicle in
            self.activeIndicator.stopAnimating()
            if listVehicle?.count == 0 {
                self.alert()
            } else {
                let vc = ListsViewController()
                guard let list = listVehicle else { return }
                vc.list = list
                vc.titleNavigation = navigationTitle
                vc.vehicle = vehicle
                
                self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Veiculos", style: .done, target: self, action: nil)
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
        })
    }
    
    func alert() {
        let alerta = UIAlertController(title: "Atenção", message: "Ocorreu algum problema, tente novamente mais tarde!", preferredStyle: .alert)
        
        alerta.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alerta, animated: true, completion: nil)
        
    }
}

extension HomeViewController : HomeViewDelegate {
    func pressButtonCar() {
        goToListBrands(.car, "Marcas de Carros")
    }
    
    func pressButtonMotorcycle() {
        goToListBrands(.motorcycle, "Marcas de Motos")
    }
    
    func pressButtonTruck() {
        goToListBrands(.truck, "Marcas de Caminhões")
    }
}
