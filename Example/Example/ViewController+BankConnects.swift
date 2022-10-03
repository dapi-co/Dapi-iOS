//
//  ViewController + BankConnects.swift
//  Example
//
//  Created by MSZ on 03/10/2022.
//

import DapiSDK
import UIKit

extension ViewController {

    @IBAction func showConnection(_ sender: UIBarButtonItem) {
        let connections = Dapi.shared.bankConnections
        let alert = UIAlertController(title: "Connection", message: "Choose a global connection to operate on", preferredStyle: .actionSheet)
        connections.forEach { (connection) in
            let button = UIAlertAction(title: connection.bankInfo.bankShortName!, style: .default) { (_) in
                self.selectedConnection = connection
                sender.title = connection.bankInfo.bankShortName!
            }
            alert.addAction(button)
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(cancelButton)
        present(alert, animated: true)
    }

    @IBAction func presentConnectLayer(_ sender: UIButton) {
        let dapi = DAPIConnectVC()
        dapi.delegate = self
        present(dapi, animated: true, completion: nil)
    }

}
extension ViewController: DAPIConnectDelegate {
    func dapiConnect(_ dapiConnect: DAPIConnectVC,
                     didSuccessfullyConnectTo bankID: String?,
                     bankConnection: DAPIBankConnection) {
        print(Dapi.shared.bankConnections)
    }

    func dapiConnect(_ dapiConnect: DAPIConnectVC,
                     didFailConnectingWith error: String) {
        print(Dapi.shared.bankConnections)
        print(error)

    }

    func dapiConnectUserDidCancel(_ dapiConnect: DAPIConnectVC) {
        print(Dapi.shared.bankConnections)
        print(#function)

    }

}
