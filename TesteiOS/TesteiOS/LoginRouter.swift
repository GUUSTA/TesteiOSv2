//  TesteiOS
//
//  Created by Gustavo Garcia Leite on 01/10/19.
//  Copyright © 2019 Gustavo Garcia Leite. All rights reserved.
//

import UIKit

//MARK: Router -
protocol LoginRouterProtocol: class {

}

class LoginRouter: LoginRouterProtocol {

    weak var viewController: UIViewController?

    static func createModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = LoginViewController(nibName: nil, bundle: nil)
        let interactor = LoginInteractor()
        let router = LoginRouter()
        let presenter = LoginPresenter(interface: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
}
