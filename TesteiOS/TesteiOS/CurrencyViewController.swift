//  TesteiOS
//
//  Created by Gustavo Garcia Leite on 01/10/19.
//  Copyright © 2019 Gustavo Garcia Leite. All rights reserved.
//

import UIKit

class CurrencyViewController: UIViewController {
    
    var presenter: CurrencyPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        API.statementsURL.get(success: { data in
            do {
                let root = try JSONDecoder().decode(StatementRoot.self, from: data)
                let statementList = root.statementList
                print(statementList)
            } catch let error as NSError{
                print(error)
            }
        }) { (error) in
            print(error)
        }
    }
    
}

extension CurrencyViewController: CurrencyViewProtocol {
    
}
