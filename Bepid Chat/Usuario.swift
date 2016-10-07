//
//  Usuario.swift
//  Bepid Chat
//
//  Created by Matheus Alves on 07/10/16.
//  Copyright © 2016 Matheus Alves. All rights reserved.
//

import Firebase

class Usuario {
    
    private static let keyNome : String = "nome"
    private static let keyEmail : String = "email"
    
    var key : String?
    var nome : String?
    var email : String?
    
    init(user : FIRUser) {
        self.key = user.uid
        self.nome = user.displayName
        self.email = user.email
    }
    
    init(snapshot: FIRDataSnapshot) {
        let values = snapshot.value as! [String: AnyObject]
        
        self.key = snapshot.key
        self.nome = values[Usuario.keyNome] as? String
        self.email = values[Usuario.keyEmail] as? String
    }
    
    func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.nome, forKey: Usuario.keyNome)
        dictionary.setValue(self.email, forKey: Usuario.keyEmail)
        
        return dictionary
    }
    
}
