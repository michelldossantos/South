//
//  ListViewModel.swift
//  South
//
//  Created by Michel dos Santos on 05/06/21.
//

import UIKit

class ListViewModel: NSObject {
    
    
    let api = APIManager()
    
    func getListModels(_ vehicle: Vehicle, brandID: String, onComplete: @escaping ([BaseClassAPI]?) -> Void) {
        var sufix = ""
        
        switch vehicle {
        case .car:
            sufix = "carros/marcas/\(String(describing: brandID))/modelos"
        case .motorcycle:
            sufix = "motos/marcas/\(String(describing: brandID))/modelos"
        case .truck:
            sufix = "caminhoes/marcas/\(String(describing: brandID))/modelos"
        }
        
        
        api.loadDataModel(path: sufix) { listModels in
            if listModels .isEmpty {
                onComplete([])
            }
            for marca in listModels {
                print(marca.name)
            }
            onComplete(listModels)

        }
    }
    
    func getListYear(_ vehicle: Vehicle,  brandID: String, modelId: String, onComplete: @escaping ([BaseClassAPI]?) -> Void) {
        var sufix = ""
        
        switch vehicle {
        case .car:
            sufix = "carros/marcas/\(String(describing: brandID))/modelos/\(String(describing: modelId))/anos"
        case .motorcycle:
            sufix = "motos/marcas/\(String(describing: brandID))/modelos/\(String(describing: modelId))/anos"
        case .truck:
            sufix = "caminhoes/marcas/\(String(describing: brandID))/modelos/\(String(describing: modelId))/anos"
        }
        
        
        api.loadData(path: sufix) { listBrands in
            if listBrands .isEmpty {
                onComplete([])
            }
            for marca in listBrands {
                print(marca.name)
            }
            onComplete(listBrands)
        }
        
    }
    
    func getDetail(_ vehicle: Vehicle,  brandID: String, modelId: String, year: String,  onComplete: @escaping (VehicleModel?) -> Void) {
        var sufix = ""
        
        switch vehicle {
        case .car:
            sufix = "carros/marcas/\(String(describing: brandID))/modelos/\(String(describing: modelId))/anos/\(String(describing: year))"
        case .motorcycle:
            sufix = "motos/marcas/\(String(describing: brandID))/modelos/\(String(describing: modelId))/anos/\(String(describing: year))"
        case .truck:
            sufix = "caminhoes/marcas/\(String(describing: brandID))/modelos/\(String(describing: modelId))/anos/\(String(describing: year))"
        }
        
        
        api.loadDataCarDetail(path: sufix) { vehicleDeteil in
            if vehicleDeteil == nil{
                onComplete(nil)
            }
            
            onComplete(vehicleDeteil)
        }
        
        
            
        
        
    }
    
    
    
    
    
}
