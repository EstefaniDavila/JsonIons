//
//  ViewController.swift
//  JSONRESTful
//
//  Created by Mac 17 on 17/06/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtUsuario: UITextField!
    @IBOutlet weak var txtContraseña: UITextField!
    

    var users =  [Users]()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    

    @IBAction func logear(_ sender: Any) {
        let ruta = "http://localhost:3000/usuarios?"
        let usuario = txtUsuario.text!
        let contraseña = txtContraseña.text!
        let url = ruta + "nombre=\(usuario)&clave=\(contraseña)"
        let crearURL = url.replacingOccurrences(of: " ", with: "%20")
        validarUsuario(ruta: crearURL) {
            if self.users.count <= 0{
                print("Nombre de usuario y/o contraseña es incorrecto")
            }else{
                print("Logeo exitoso")
                self.performSegue(withIdentifier: "segueLogeo", sender: nil)
                for data in self.users{
                    print("id: \(data.id), nombre: \(data.nombre), nombre: \(data.email)")
                }
            }
        }
    }
    
    func validarUsuario(ruta:String, completed: @escaping() -> ()){
        let url = URL(string: ruta)
        URLSession.shared.dataTask(with: url!){(data,response,error) in
            if error == nil {
                do{
                    self.users = try JSONDecoder().decode([Users].self, from: data!)
                    DispatchQueue.main.async {
                        completed()
                    }
                }catch{
                    print("Error en JSON")
                }
            }
        }.resume()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueLogeo"{
            let nav = segue.destination as! UINavigationController
            let svc = nav.topViewController as! ViewControllerBuscar
            svc.users = sender as? Users
        }
    }
    


}

