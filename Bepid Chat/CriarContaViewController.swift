//
//  CriarContaViewController.swift
//  Bepid Chat
//
//  Created by Matheus Alves on 07/10/16.
//  Copyright © 2016 Matheus Alves. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class CriarContaViewController: UIViewController {

    @IBOutlet weak var btEnviar: UIBarButtonItem!
    @IBOutlet weak var tfNome: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfSenha: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func actionEnviar(_ sender: AnyObject) {
        self.solicitarCriacaoSenha()
    }
    
    private func solicitarCriacaoSenha(){
        
        if let nome = self.tfNome.text, nome != "", let email = self.tfEmail.text, email != "", let senha = self.tfSenha.text, senha != "" {
            
            FIRAuth.auth()?.createUser(withEmail: email, password: senha) {
                (user, error) in
                
                if let error = error {
                    print(error.localizedDescription)
                    self.alertar(titulo: "Erro", mensagem: error.localizedDescription)
                    return
                }
                self.setDisplayName(user!)
                
            }
            
        } else {
            self.alertar(titulo: "Aviso!", mensagem: "Campo de Nome, Email e Senha não pode estar vazio")
        }
        
    }
    
    func setDisplayName(_ user: FIRUser) {
        let changeRequest = user.profileChangeRequest()
        changeRequest.displayName = user.email!.components(separatedBy: "@")[0]
        changeRequest.commitChanges(){ (error) in
            if let error = error {
                print(error.localizedDescription)
                self.alertar(titulo: "Erro", mensagem: error.localizedDescription)
                return
            }
            self.enviarParaMainController()
        }
    }
    
    private func habilitarUI( _ b : Bool ){
        
        self.tfNome.isEnabled = b
        self.tfEmail.isEnabled = b
        self.tfSenha.isEnabled = b
        self.btEnviar.isEnabled = b
        
    }
    
}