//
//  Peliculas.swift
//  JSONRESTful
//
//  Created by Mac 17 on 18/06/22.
//

import Foundation
struct Peliculas:Decodable{
    let usuarioId:Int
    let id:Int
    let nombre:String
    let genero:String
    let duracion:String
}
