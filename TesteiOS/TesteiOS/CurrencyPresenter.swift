//  TesteiOS
//
//  Created by Gustavo Garcia Leite on 01/10/19.
//  Copyright © 2019 Gustavo Garcia Leite. All rights reserved.
//

import UIKit

//MARK: View -
protocol CurrencyViewProtocol: class {

    var presenter: CurrencyPresenterProtocol?  { get set }
    
    func doDidLoad()
    func doViewWillAppear()
    /* Presenter -> ViewController */
}

//MARK: Presenter -
protocol CurrencyPresenterProtocol: class {

    var interactor: CurrencyInteractorInputProtocol? { get set }
    var user: User? { get set }
    var statements: [Statement]? { get set }
    
    func viewDidLoad()
    func viewWillAppear()
    func dismissView()
    func sendUser(user: User)
    func getStatements()
}

class CurrencyPresenter: CurrencyPresenterProtocol {

    weak private var view: CurrencyViewProtocol?
    var interactor: CurrencyInteractorInputProtocol?
    private let router: CurrencyRouterProtocol
    var user: User?
    var statements: [Statement]?

    init(interface: CurrencyViewProtocol, interactor: CurrencyInteractorInputProtocol?, router: CurrencyRouterProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

    func sendUser(user: User) {
        self.user = user
    }
    
    func viewDidLoad() {
        guard let view = view else { return }
        view.doDidLoad()
    }
    
    func getStatements() {
        guard let interactor = interactor else { return }
        interactor.requestStatements()
    }
    
    func viewWillAppear() {
        guard let view = view else { return }
        view.doViewWillAppear()
    }
    
    func dismissView() {
        router.dismiss()
    }
}

extension CurrencyPresenter: CurrencyInteractorOutputProtocol {
    func sendStatements(statements: [Statement]) {
        self.statements = statements
    }
}
