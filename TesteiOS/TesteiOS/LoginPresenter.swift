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
    /* Presenter -> ViewController */
}

//MARK: Presenter -
protocol LoginPresenterProtocol: class {

    var interactor: LoginInteractorInputProtocol? { get set }
    
    func viewWillAppear()
    func requestLogin(user: String, password: String)
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
    
    func viewWillAppear() {
        guard let view = view else { return }
        view.doViewWillAppear()
    }
    
    func requestLogin(user: String, password: String) {
        guard let interactor = interactor else { return }
        
        interactor.requestDataToAPI(user: user, password: password)
    }
    
    private func checkPassword(passaword: String) {
        
    }
}

//MARK: LoginInteractorOutputProtocol
extension LoginPresenter: LoginInteractorOutputProtocol{
    func showData(data: User) {
        print(data)
    }
}
