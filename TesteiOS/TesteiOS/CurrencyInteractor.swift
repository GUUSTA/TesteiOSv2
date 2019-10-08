//  TesteiOS
//
//  Created by Gustavo Garcia Leite on 01/10/19.
//  Copyright © 2019 Gustavo Garcia Leite. All rights reserved.
//

import UIKit

//MARK: Interactor -
protocol CurrencyInteractorOutputProtocol: class {

    /* Interactor -> Presenter */
    func sendStatements(statements: [Statement])
}

protocol CurrencyInteractorInputProtocol: class {

    var presenter: CurrencyInteractorOutputProtocol?  { get set }

    /* Presenter -> Interactor */
    func requestStatements()
}

class CurrencyInteractor: CurrencyInteractorInputProtocol {

    weak var presenter: CurrencyInteractorOutputProtocol?
    
    func requestStatements() {
        API.statementsURL.get(success: { data in
            do {
                guard let presenter = self.presenter else { return }
                let root = try JSONDecoder().decode(StatementRoot.self, from: data)
                let statementList = root.statementList
                presenter.sendStatements(statements: statementList)
                print(statementList)
            } catch let error as NSError{
                print(error)
            }
        }) { (error) in
            print(error)
        }
    }
}
