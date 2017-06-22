//
//  RegistrationViewController.swift
//  TodoApp
//
//  Created by Asal Rostami on 2017-06-22.
//  Copyright © 2017 Fatih Nayebi. All rights reserved.
//

import UIKit


protocol registerationProtocol {
    
    func register(username:String,password:String)
}

class RegistrationViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var userNameTextField: UITextField!

    @IBOutlet weak var lbWarning: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var delegate : registerationProtocol?

    
    @IBAction func btnRegister(_ sender: UIButton) {
        
//        let user = userNameTextField.text!
//        let pass = passwordTextField.text!
//        
//        if user == "" || pass == ""
//        {
//            lbWarning.text = "Please enter the requiered information!"
//        }
//        else
//        {
//            delegate?.register(username: user, password: pass)
//            self.dismiss(animated: true, completion: nil)
//        }
        
        guard
            let user = userNameTextField.text,
            let password = passwordTextField.text
            else {
                let alert = UIAlertController(title: "Error", message: "Please input username and password", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
                return
        }
        RegisterManager.register(userName: user, password: password){
            (responseData, error) in
            if let response = responseData {
                if response.success == true {
                    
                    self.delegate?.register(username: user, password: password)
                    self.dismiss(animated: true, completion: nil)
                    self.dismiss(animated: true, completion: nil)
                }else {
                    print("There is an error")
                    let alert = UIAlertController(title: "Error", message: "User name and password were not correct", preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
                }
            }else if  error == true {
                print("Backend error")
                let alert = UIAlertController(title: "Error", message: "Something went wrong with the backend", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            }
        }

        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
