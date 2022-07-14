//
//  Users.swift
//  JSONRESTful
//
//  Created by Mac 17 on 17/06/22.
//

import Foundation
struct Users:Decodable{
    let id:Int
    let nombre:String
    let clave:String
    let email:String
}
