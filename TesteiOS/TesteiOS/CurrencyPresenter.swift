//  TesteiOS
//
//  Created by Gustavo Garcia Leite on 01/10/19.
//  Copyright © 2019 Gustavo Garcia Leite. All rights reserved.
//

import UIKit

//MARK: View -
protocol CurrencyViewProtocol: class {

    var presenter: CurrencyPresenterProtocol?  { get set }

    /* Presenter -> ViewController */
}

//MARK: Presenter -
protocol CurrencyPresenterProtocol: class {

    var interactor: CurrencyInteractorInputProtocol? { get set }
}

class CurrencyPresenter: CurrencyPresenterProtocol {

    weak private var view: CurrencyViewProtocol?
    var interactor: CurrencyInteractorInputProtocol?
    private let router: CurrencyRouterProtocol

    init(interface: CurrencyViewProtocol, interactor: CurrencyInteractorInputProtocol?, router: CurrencyRouterProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}

extension CurrencyPresenter: CurrencyInteractorOutputProtocol {
    
}
