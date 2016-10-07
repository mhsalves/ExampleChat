//
//  LoginViewController.swift
//  Bepid Chat
//
//  Created by Matheus Alves on 07/10/16.
//  Copyright © 2016 Matheus Alves. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfSenha: UITextField!
    
    @IBOutlet weak var btEsqueci: UIButton!
    @IBOutlet weak var btCriar: UIButton!
    
    @IBOutlet weak var btEntrar: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.habilitarUI(true)
    }

    
    @IBAction func actionEntrar(_ sender: AnyObject) {
        self.enviarSolicitacao()
    }
    
    private func enviarSolicitacao(){
        
        self.habilitarUI(false)
        
        if let email = self.tfEmail.text, let pass = self.tfSenha.text {
            
            if email != "" && pass != "" {
                
                FIRAuth.auth()?.signIn(withEmail: email, password: pass) {
                    (user, error) in
                    
                    if let error = error {
                        print(error.localizedDescription)
                        self.alertar(titulo: "Erro", mensagem: error.localizedDescription)
                        self.habilitarUI(true)
                    } else {
                        self.enviarParaMainController()
                    }
                    
                }
            
            } else {
                self.alertar(titulo: "Aviso !", mensagem: "Email ou senha não podem ser vazios")
                self.habilitarUI(true)
            }
        } else {
            
            self.alertar(titulo: "Aviso !", mensagem: "Email ou senha não podem ser vazios")
            self.habilitarUI(true)
            
        }
    
    }
    
    private func habilitarUI( _ b : Bool ){
    
        if !b {
            self.tfSenha.isEnabled = false
            self.tfEmail.isEnabled = false
            self.btEsqueci.isEnabled = false
            self.btCriar.isEnabled = false
            self.btEntrar.isEnabled = false
        } else {
            self.tfSenha.isEnabled = true
            self.tfEmail.isEnabled = true
            self.btEsqueci.isEnabled = true
            self.btCriar.isEnabled = true
            self.btEntrar.isEnabled = true
        }
        
    }

}
