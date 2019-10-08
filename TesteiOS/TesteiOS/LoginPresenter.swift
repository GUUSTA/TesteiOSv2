//  TesteiOS
//
//  Created by Gustavo Garcia Leite on 01/10/19.
//  Copyright © 2019 Gustavo Garcia Leite. All rights reserved.
//

import UIKit

//MARK: View -
protocol LoginViewProtocol: class {
    
    var presenter: LoginPresenterProtocol?  { get set }
    
    func doViewWillAppear()
    func doViewWillDisappear()
    func invalidPassword()
    func invalidUser()
    func doDidLoad()
    func hideKeyboard(textField: UITextField)
    /* Presenter -> ViewController */
}

//MARK: Presenter -
protocol LoginPresenterProtocol: class {
    
    var interactor: LoginInteractorInputProtocol? { get set }
    
    func viewDidLoad()
    func viewWillAppear()
    func viewWillDisappear()
    func requestLogin(user: String, password: String)
    func hideKeyboard(textField: UITextField)
}

class LoginPresenter: LoginPresenterProtocol {
    
    weak private var view: LoginViewProtocol?
    var interactor: LoginInteractorInputProtocol?
    private let router: LoginRouterProtocol
    
    init(interface: LoginViewProtocol, interactor: LoginInteractorInputProtocol?, router: LoginRouterProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        guard let view = view else { return }
        view.doDidLoad()
    }
    
    func viewWillAppear() {
        guard let view = view else { return }
        view.doViewWillAppear()
    }
    
    func viewWillDisappear() {
        guard let view = view else { return }
        view.doViewWillDisappear()
    }
    
    func requestLogin(user: String, password: String) {
        // If the user fill out with a valid CPF or email.
        guard user.isValidCPF() || user.isValidEmail() else {
            guard let view = view else { return }
            view.invalidUser()
            return
        }
        // If the user fill out with a vaid password like "Gustavo10@"
        guard password.isValidPassword() else {
            guard let view = view else { return }
            view.invalidPassword()
            return
        }
        
        // If all goes well, request interactor to make a call Api
        guard let interactor = interactor else { return }
        interactor.requestUser(user: user, password: password)
    }
    
    func hideKeyboard(textField: UITextField) {
        guard let view = view else { return }
        view.hideKeyboard(textField: textField)
    }
}

//MARK: LoginInteractorOutputProtocol
extension LoginPresenter: LoginInteractorOutputProtocol {
    func pushCurrency(data: User) {
        router.pushToStatements(user: data)
    }
}
