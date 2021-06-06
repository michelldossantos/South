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
    
    private lazy var homeView: HomeView = {
        let view = HomeView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 60))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewmodel = HomeViewModel()
        view.backgroundColor = .red
        view.addSubview(homeView)
        title = "Tabela Fipe South System"
        
        homeView.anchor( top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
    }
}
extension HomeViewController {
    
    func goToListBrands(_ vehicle: Vehicle) {
        viewmodel?.getListVehicle(vehicle, onComplete: { listVehicle in
            let vc = ListsViewController()
            guard let list = listVehicle else { return }
                vc.list = list
            
            self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Veiculos", style: .done, target: self, action: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        })
    }
}

extension HomeViewController : HomeViewDelegate {
    func pressButtonCar() {
        goToListBrands(.car)
    }
    
    func pressButtonMotorcycle() {
        goToListBrands(.motorcycle)
    }
    
    func pressButtonTruck() {
        goToListBrands(.truck)
    }
}
