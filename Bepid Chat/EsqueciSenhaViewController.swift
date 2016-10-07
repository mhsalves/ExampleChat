//
//  EsqueciSenhaViewController.swift
//  Bepid Chat
//
//  Created by Matheus Alves on 07/10/16.
//  Copyright © 2016 Matheus Alves. All rights reserved.
//

import UIKit
import Firebase

class EsqueciSenhaViewController: UIViewController {

    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var btEnvair: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func actionEnviar(_ sender: AnyObject) {
        self.solicitarRecuperacaoSenha()
    }
    
    private func solicitarRecuperacaoSenha(){
        
        if let email = self.tfEmail.text, email != "" {
            self.habilitarUI(false)
            
            FIRAuth.auth()?.sendPasswordReset(withEmail: email) { (error) in
                if let error = error {
                    print(error.localizedDescription)
                    self.habilitarUI(true)
                    return
                }
            }
            
        } else {
            self.alertar(titulo: "Aviso!", mensagem: "Campo de Email não pode estar vazio")
        }
        
        
    
    }
    
    private func habilitarUI( _ b : Bool ){
        
        self.tfEmail.isEnabled = b
        self.btEnvair.isEnabled = b
        
    }
    
}
