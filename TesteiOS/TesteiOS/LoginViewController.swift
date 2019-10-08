//  TesteiOS
//
//  Created by Gustavo Garcia Leite on 01/10/19.
//  Copyright © 2019 Gustavo Garcia Leite. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnTopAnchor: NSLayoutConstraint!
    
    // MARK: Variables
    var presenter: LoginPresenterProtocol?
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let presenter = presenter else { return }
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let presenter = presenter else { return }
        presenter.viewWillAppear()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        guard let presenter = presenter else { return }
        presenter.viewWillDisappear()
    }
    
    // MARK: IBActions
    @IBAction func loginAction(_ sender: UIButton) {
        guard let presenter = presenter else { return }
        guard let user = txtUser.text else { return }
        guard let password = txtPassword.text else { return }
        presenter.requestLogin(user: user, password: password)
    }
    
    @IBAction func txtfieldUserReturnTapped(_ sender: UITextField) {
        guard let presenter = presenter else { return }
        presenter.hideKeyboard(textField: sender)
    }
    
    @IBAction func txtfieldPasswordReturnTapped(_ sender: UITextField) {
        guard let presenter = presenter else { return }
        presenter.hideKeyboard(textField: sender)
    }
} // MARK: End LoginViewController

extension LoginViewController: LoginViewProtocol {
    
    func loginButtonIsEnabled(enable: Bool) {
        btnLogin.isEnabled = enable
        enable ? (btnLogin.alpha = 1.0) : (btnLogin.alpha = 0.6)
    }
    
    func invalidUser() {
        let alert = UIAlertController(title: "Invalid Username", message: "Login with your email or CPF to access the application.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func invalidPassword() {
        let alert = UIAlertController(title: "Invalid Password", message: "Login with a valid password to access the application.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func doViewWillAppear() {
        guard let navigation = self.navigationController else { return }
        navigation.isToolbarHidden = true
    }
    
    func doViewWillDisappear() {
        guard let navigation = self.navigationController else { return }
        navigation.isToolbarHidden = false
    }
    
    func doDidLoad() {
        btnLogin.cornerRadius(to: 5)
        loginButtonIsEnabled(enable: true)
    }
    
    func hideKeyboard(textField: UITextField) {
        textField.resignFirstResponder()
    }
}
