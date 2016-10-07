//
//  PerfilTableViewController.swift
//  Bepid Chat
//
//  Created by Matheus Alves on 07/10/16.
//  Copyright © 2016 Matheus Alves. All rights reserved.
//

import UIKit
import Firebase

class PerfilTableViewController: UITableViewController {

    @IBOutlet weak var ivPhoto: UIImageView!
    @IBOutlet weak var lbNome: UILabel!
    @IBOutlet weak var lbEmail: UILabel!
    
    var window: UIWindow?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let user = FIRAuth.auth()?.currentUser {
            
            self.lbNome.text = user.displayName
            self.lbEmail.text = user.email
            
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)
        
        if cell?.reuseIdentifier == "cellItemSair" {
            
            //Deslogar
            if let _ = FIRAuth.auth()?.currentUser {
                
                do {
                    try FIRAuth.auth()?.signOut()
                    self.chamarTelaLogin()
                } catch {
                    self.alertar(titulo: "Erro", mensagem: "Erro ao deslogar")
                }
                
            }
        }
        
    }
    
    func chamarTelaLogin(){
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        let rootView = storyBoard.instantiateViewController(withIdentifier: "LoginController") as! UINavigationController
        self.window?.rootViewController = rootView
        self.window?.makeKeyAndVisible()
    }

}
