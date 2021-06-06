//
//  HomeViewModel.swift
//  South
//
//  Created by Michel dos Santos on 05/06/21.
//

import Foundation


class HomeViewModel {
    
    let api = APIManager()

    func getCarList() {
        api.loadData(path: "/carros/marcas") { listBrands in
            for marca in listBrands {
                print(marca.name)
        }
            
        }
    }
    
    func getMotorcycleList() {
        
    }
    
    func getTruckList() {
        
    }
    
    
}
