//
//  ViewController + DataAPIs.swift
//  Example
//
//  Created by MSZ on 03/10/2022.
//

import DapiSDK
import UIKit

extension ViewController{

    @IBAction func accountMetadata(_ sender: UIButton) {
        guard let connection = selectedConnection else {
            showMessage("Please select bank connection first to be used in this API")
            return
        }
        Dapi.shared.accountMetadata(bankConnection: connection) { results in
            switch results {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error.dapiErrorMessage)
                print(error.dapiMetaData)
            }
        }
    }

    @IBAction func identity(_ sender: UIButton) {
        guard let connection = selectedConnection else {
            showMessage("Please select bank connection first to be used in this API")
            return
        }
        Dapi.shared.identity(bankConnection: connection) { results in
            switch results {
            case .success:
                break
            case .failure(let error):
                print(error.dapiMetaData)
                print(error.dapiErrorMessage)
            }
        }
    }


    @IBAction func bankCards(_ sender: UIButton) {
        guard let connection = selectedConnection else {
            showMessage("Please select bank connection first to be used in this API")
            return
        }
        Dapi.shared.bankCards(bankConnection: connection) { results in
            switch results {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error.dapiErrorMessage)
            }
        }
    }

    @IBAction func accounts(_ sender: UIButton) {
        guard let connection = selectedConnection else {
            showMessage("Please select bank connection first to be used in this API")
            return
        }
        Dapi.shared.bankAccounts(bankConnection: connection) { results in
            switch results {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error.dapiErrorMessage)
            }
        }
    }

    @IBAction func accountTransactions(_ sender: UIButton) {
        guard let connection = selectedConnection else {
            showMessage("Please select bank connection first to be used in this API")
            return
        }
        Dapi.shared.bankAccounts(bankConnection: connection) { results in
            switch results {
            case .success(let response):
                let sss = DateFormatter()
                sss.dateFormat = "yyyy-MM-dd"
                Dapi.shared.accountTransactions(bankConnection: connection,
                                                bankAccountID: response.accounts.first!.id,
                                                type: .enriched,
                                                from: sss.date(from: "2022-01-25")!,
                                                to: sss.date(from: "2022-04-25")!) { results in
                    switch results {
                    case .success(let response):
                        print(response)
                    case .failure(let error):
                        print(error.dapiErrorMessage)
                    }

                }
            case .failure(let error):
                print(error.dapiErrorMessage)
            }
        }

    }

    @IBAction func cardTransactions(_ sender: UIButton) {
        guard let connection = selectedConnection else {
            showMessage("Please select bank connection first to be used in this API")
            return
        }
        Dapi.shared.bankCards(bankConnection: connection) { results in
            switch results {
            case .success(let response):
                let sss = DateFormatter()
                sss.dateFormat = "yyyy-MM-dd"
                Dapi.shared.cardTransactions(bankConnection: connection,
                                             cardID: response.cards.first!.id,
                                             type: .enriched,
                                             from: sss.date(from: "2021-01-25")!,
                                             to: sss.date(from: "2021-04-25")!) { results in
                    switch results {
                    case .success(let response):
                        print(response)
                    case .failure(let error):
                        print(error.dapiErrorMessage)
                    }
                }
            case .failure(let error):
                print(error.dapiErrorMessage)
            }
        }

    }

    @IBAction func deleteConnection(_ sender: UIButton) {
        guard let connection = selectedConnection else {
            showMessage("Please select bank connection first to be used in this API")
            return
        }
        Dapi.shared.delink(bankConnection: connection) { results in
            switch results {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error.dapiMetaData)
                print(error.dapiErrorMessage)
            }
        }
    }

    @IBAction func getConnectionParameters(_ sender: UIButton) {
        guard let connection = selectedConnection else {
            showMessage("Please select bank connection first to be used in this API")
            return
        }
        print(connection.getParameters())
    }

    @IBAction func createConnection(_ sender: UIButton) {
        Dapi.shared.createBankConnection(parameters: bankConnectionParams) { results in
            switch results {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error.dapiMetaData)
                print(error.dapiErrorMessage)
            }
        }
    }


}
