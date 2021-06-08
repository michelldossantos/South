//
//  ApiManager.swift
//  South
//
//  Created by Michel dos Santos on 05/06/21.
//

import UIKit
import Alamofire


class APIManager {
    
    var vehicleDetail: VehicleModel?
    var arrayDate = [BaseClassAPI]()
    
    var apiBaseUrl = "https://parallelum.com.br/fipe/api/v1"
    
    func loadData(path: String , onComplete: @escaping ([BaseClassAPI]) -> Void) {
            AF.request("\(apiBaseUrl)/\(path)").responseJSON { response in
                if let json = response.value as? [[String: Any]] {
                    var brands = [BaseClassAPI]()
                    for item in json {
                        brands.append(BaseClassAPI(fromDictionary: item))
                    }
                    self.arrayDate = brands
                    onComplete(self.arrayDate)
                    return
                }
                onComplete([])
            }
        }
    
    
    func loadDataModel(path: String , onComplete: @escaping ([BaseClassAPI]) -> Void) {
            AF.request("\(apiBaseUrl)/\(path)").responseJSON { response in
                if let json = response.value as? [String: Any], let jsonModels = json["modelos"] as? [[String:Any]] {
                    var models = [BaseClassAPI]()
                    for item in jsonModels {
                        models.append(BaseClassAPI(fromDictionary: item))
                    }
                    self.arrayDate = models
                    onComplete(models)
                    return
                }
                onComplete([])
            }
        }
    
    
    func loadDataCarDetail(path: String , onComplete: @escaping (VehicleModel?) -> Void) {
            AF.request("\(apiBaseUrl)/\(path)").responseJSON { response in
                if let json = response.value as? [String: Any] {
                    print(json)
                    let carDetail = VehicleModel(fromDictionary: json)

                    self.vehicleDetail = carDetail
//
                    onComplete(carDetail)
                    return
                }
                onComplete(nil)
            }
        }
    
    
}






