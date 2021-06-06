//
//  VehicleModel.swift
//  South
//
//  Created by Michel dos Santos on 06/06/21.
//

import Foundation


class VehicleModel: NSObject{
    
    var anoModelo : Int!
    var codigoFipe : String!
    var combustivel : String!
    var marca : String!
    var mesReferencia : String!
    var modelo : String!
    var siglaCombustivel : String!
    var tipoVeiculo : Int!
    var valor : String!
    
    init(fromDictionary dictionary: [String:Any]){
        anoModelo = dictionary["AnoModelo"] as? Int
        codigoFipe = dictionary["CodigoFipe"] as? String
        combustivel = dictionary["Combustivel"] as? String
        marca = dictionary["Marca"] as? String
        mesReferencia = dictionary["MesReferencia"] as? String
        modelo = dictionary["Modelo"] as? String
        siglaCombustivel = dictionary["SiglaCombustivel"] as? String
        tipoVeiculo = dictionary["TipoVeiculo"] as? Int
        valor = dictionary["Valor"] as? String
    }
}
