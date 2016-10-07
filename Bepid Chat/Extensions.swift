//
//  Extensions.swift
//  Bepid Chat
//
//  Created by Matheus Alves on 07/10/16.
//  Copyright © 2016 Matheus Alves. All rights reserved.
//

import UIKit
import Firebase

extension UIViewController {
    
    func alertar(titulo: String, mensagem: String ){
        
        let alert = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let action = UIAlertAction(title: "👍", style: .default, handler: nil)
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func enviarParaMainController() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MainController") as! UITabBarController
        self.present(vc, animated: true, completion: nil)
    }
    
}

extension FIRDatabase {
    
    func usuarios() -> FIRDatabaseReference {
        
        let ref = FIRDatabase.database().reference().child("usuarios")
        
        return ref
    }
    
}
