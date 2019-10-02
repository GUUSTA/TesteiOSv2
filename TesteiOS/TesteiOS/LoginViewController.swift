//  Created Gustavo Garcia Leite on 01/10/19.
//  Copyright © 2019 Gustavo Garcia Leite. All rights reserved.
//
//  Template generated by Fauzi Sholichin @fauzisho
//  Component: View -

import UIKit

class LoginViewController: UIViewController {

// MARK: IBOutlets
    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
// MARK: Variables
	var presenter: LoginPresenterProtocol?

// MARK: View Lifecycle
	override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let presenter = presenter else { return }
        presenter.viewWillAppear()
    }

// MARK: IBActions
    @IBAction func loginAction(_ sender: UIButton) {
        guard let presenter = presenter else { return }
        presenter.requestLogin()
    }
} // MARK: End LoginViewController

extension LoginViewController: LoginViewProtocol {
    func doViewWillAppear() {
        btnLogin.cornerRadius(to: 5)
    }
}
