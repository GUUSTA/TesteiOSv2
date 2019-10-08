//  TesteiOS
//
//  Created by Gustavo Garcia Leite on 01/10/19.
//  Copyright © 2019 Gustavo Garcia Leite. All rights reserved.
//

import UIKit

//MARK: Interactor -
protocol LoginInteractorOutputProtocol: class {

    /* Interactor -> Presenter */
    func pushCurrency(data: User)
}

protocol LoginInteractorInputProtocol: class {

    var presenter: LoginInteractorOutputProtocol?  { get set }

    /* Presenter -> Interactor */
    func requestUser(user: String, password: String)
}

class LoginInteractor: LoginInteractorInputProtocol {

    weak var presenter: LoginInteractorOutputProtocol?
    
    func requestUser(user: String, password: String) {
        API.loginURL.post(user: user, password: password, success: { data in
            do {
                guard let presenter = self.presenter else { return }
                let root = try JSONDecoder().decode(UserRoot.self, from: data)
                let user = root.userAccount
                print(user)
                print()
                print()
                presenter.pushCurrency(data: user)
            } catch let error as NSError{
                print(error)
            }
        }) { (error) in
            print(error)
        }
    }
}
