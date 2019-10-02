//  Created Gustavo Garcia Leite on 01/10/19.
//  Copyright © 2019 Gustavo Garcia Leite. All rights reserved.
//
//  Template generated by Fauzi Sholichin @fauzisho
//  Component: Interactor -

import UIKit

//MARK: Interactor -
protocol LoginInteractorOutputProtocol: class {

    /* Interactor -> Presenter */
}

protocol LoginInteractorInputProtocol: class {

    var presenter: LoginInteractorOutputProtocol?  { get set }

    /* Presenter -> Interactor */
}

class LoginInteractor: LoginInteractorInputProtocol {

    weak var presenter: LoginInteractorOutputProtocol?
}
