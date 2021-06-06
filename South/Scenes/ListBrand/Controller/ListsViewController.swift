//
//  ListsViewController.swift
//  South
//
//  Created by Michel dos Santos on 05/06/21.
//

import UIKit

class ListsViewController: UIViewController {
    
    var list: [BaseClassAPI] = []
    var titleNavigation: String = ""
    var vehicle: Vehicle?
    private var idBrand: String?
    private var idModel: String?
    private var idYear: String?
    private var goModels = true
    private var goYear = false
    
    
    private var viewModel: ListViewModel?
    
    fileprivate lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .gray
        tableView.bounces = false
        tableView.separatorColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = true
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    //MARK: ======= Life Cycle ======
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ListViewModel()
        configurarTableView()
        configurarNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.barTintColor = .gray
    }
}

extension ListsViewController {
    
    func configurarNavigationBar() {
        self.title = titleNavigation
        self.navigationController?.navigationBar.barTintColor = .gray
    }
    
    func configurarTableView() {
        self.view.backgroundColor = .blue
        self.view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}

extension ListsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return   list.count  }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = list[indexPath.row].name
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.textColor = .white
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.font = UIFont(name: "AvenirNext-Bold", size: 28)
        cell.backgroundColor = .gray
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if goModels && !goYear {
            self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Lista de Marcas", style: .done, target: self, action: nil)
            
            
            guard let vehicle = self.vehicle else { return }
            
            self.idBrand = list[indexPath.row].id
            viewModel?.getListModels(vehicle, brandID: self.idBrand!, onComplete: { listModels in
                let vc = ListsViewController()
                vc.list = listModels!
                vc.goModels = false
                vc.goYear = true
                vc.vehicle = vehicle
                vc.idBrand = self.idBrand
                vc.titleNavigation = "Modelos"
                self.navigationController?.pushViewController(vc, animated: true)
            })
        } else if !goModels && goYear {
            self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Lista de Modelos", style: .done, target: self, action: nil)
            
            guard let vehicle = self.vehicle else { return }

            self.idModel = list[indexPath.row].id
            viewModel?.getListYear(vehicle, brandID: self.idBrand!, modelId: idModel!, onComplete: { listYear in
                let vc = ListsViewController()
                vc.list = listYear!
                vc.titleNavigation = "Ano do Veículo"
                vc.vehicle = vehicle
                vc.idBrand = self.idBrand
                vc.idModel = self.idModel
                vc.goModels = false
                vc.goYear = false
//                vc.idYear = listYear[indexPath.row]
                self.navigationController?.pushViewController(vc, animated: true)
            })
            
        } else {
            self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Anos", style: .done, target: self, action: nil)
            self.idYear = list[indexPath.row].id
            viewModel?.getDetail(vehicle!, brandID: self.idBrand!, modelId: self.idModel!, year: self.idYear!, onComplete: { [self] vehicel in
                let vc = VehicleDetailViewController()
                vc.setupView(vehicle: vehicel!, typeVehicle: vehicle!)
                
                self.navigationController?.pushViewController(vc, animated: true)
            })
            
            
        }
    }
}
