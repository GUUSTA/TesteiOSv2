//  Created Gustavo Garcia Leite on 01/10/19.
//  Copyright © 2019 Gustavo Garcia Leite. All rights reserved.
//
//  Template generated by Fauzi Sholichin @fauzisho
//  Component: Interactor -

import UIKit

//MARK: Interactor -
protocol CurrencyInteractorOutputProtocol: class {

    /* Interactor -> Presenter */
}

protocol CurrencyInteractorInputProtocol: class {

    var presenter: CurrencyInteractorOutputProtocol?  { get set }

    /* Presenter -> Interactor */
}

class CurrencyInteractor: CurrencyInteractorInputProtocol {

    weak var presenter: CurrencyInteractorOutputProtocol?
}
