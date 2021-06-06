//
//  HomeViewModel.swift
//  South
//
//  Created by Michel dos Santos on 05/06/21.
//

import Foundation


class HomeViewModel {
    
    let api = APIManager()
    
    func getListVehicle(_ vehicle: Vehicle) {
        var sufix = ""
        
        switch vehicle {
        case .car:
            sufix = "carros/marcas"
        case .motorcycle:
            sufix = "motos/marcas"
        case .truck:
            sufix = "caminhoes/marcas"
            
        }
        
        api.loadData(path: sufix) { listBrands in
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
