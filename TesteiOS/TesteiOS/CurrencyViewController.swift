//  TesteiOS
//
//  Created by Gustavo Garcia Leite on 01/10/19.
//  Copyright © 2019 Gustavo Garcia Leite. All rights reserved.
//

import UIKit

class CurrencyViewController: UIViewController {
    
    @IBOutlet weak var btnLogout: UIButton!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAccountAndAgency: UILabel!
    @IBOutlet weak var lblBalance: UILabel!
    
    var presenter: CurrencyPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let presenter = presenter else { return }
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let presenter = presenter else { return }
        presenter.viewWillAppear()
    }
    
    @IBAction func logoutDismiss(_ sender: UIButton) {
        guard let presenter = presenter else { return }
        presenter.dismissView()
    }
}

extension CurrencyViewController: CurrencyViewProtocol {
    func doDidLoad() {
        guard let presenter = presenter, let user = presenter.user else { return }
        lblName.text = user.name
        lblAccountAndAgency.text = "\(user.bankAccount) / \(user.agency.prefix(2)).\(user.agency.substring(2 ..< 8))-\(user.agency.suffix(1))"
        lblBalance.text = "R$\(user.balance),00"
    }
    
    func doViewWillAppear() {
    }
}
