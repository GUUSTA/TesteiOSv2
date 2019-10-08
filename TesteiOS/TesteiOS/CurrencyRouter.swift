//  TesteiOS
//
//  Created by Gustavo Garcia Leite on 01/10/19.
//  Copyright © 2019 Gustavo Garcia Leite. All rights reserved.
//

import UIKit

//MARK: Router -
protocol CurrencyRouterProtocol: class {
    func dismiss()
}

class CurrencyRouter: CurrencyRouterProtocol {

    weak var viewController: UIViewController?

    static func createModule(user: User) -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = CurrencyViewController(nibName: nil, bundle: nil)
        let interactor = CurrencyInteractor()
        let router = CurrencyRouter()
        let presenter = CurrencyPresenter(interface: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
    
    func dismiss() {
        guard let currencyController = viewController else { return }
        currencyController.dismiss(animated: true, completion: nil)
    }
}
