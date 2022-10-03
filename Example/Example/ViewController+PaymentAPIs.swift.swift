//
//  ViewController + PaymentAPIs.swift
//  Example
//
//  Created by MSZ on 03/10/2022.
//

import DapiSDK
import UIKit

extension ViewController {


    @IBAction func transferAutoFlow(_ sender: UIButton) {
        guard let connection = selectedConnection else {
            showMessage("Please select bank connection first to be used in this API")
            return
        }
        let view = DAPIAutoFlowVC(bankConnection: connection,
                                  beneficiary: self.dapiBeneficiary,
                                  transferType: .normal)
        //        let view = DAPIAutoFlowVC(bankConnection: connection,
        //                                  beneficiary: self.dapiBeneficiary,
        //                                  transferType: .normal)
        view.autoFlowDelegate = self
        view.transferDidFailed = { error in
            print(error)
        }
        view.transferDidSuccess = { success in
            print(success)
        }
        self.present(view, animated: true)

    }

    @IBAction func bankBeneficiaries(_ sender: UIButton) {
        guard let connection = selectedConnection else {
            showMessage("Please select bank connection first to be used in this API")
            return
        }
        Dapi.shared.bankBeneficiaries(bankConnection: connection) { results in
            switch results {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error.dapiErrorMessage)
            }
        }
    }


    @IBAction func createBankBeneficiary(_ sender: UIButton) {
        guard let connection = selectedConnection else {
            showMessage("Please select bank connection first to be used in this API")
            return
        }
        Dapi.shared.createBeneficiary(bankConnection: connection,
                                      beneficiaryDetails: dapiBeneficiary) { results in
            switch results {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error.dapiErrorMessage)
            }
        }

    }


    @IBAction func createTransfer(_ sender: UIButton) {
        guard let connection = selectedConnection else {
            showMessage("Please select bank connection first to be used in this API")
            return
        }
        Dapi.shared.bankAccounts(bankConnection: connection) { results in
            switch results {
            case .success(let response):
                Dapi.shared.createTransfer(bankConnection: connection,
                                           senderBankAccount: response.accounts.first!,
                                           receiverBeneficiary: nil,
                                           amount: 12.0,
                                           remark: "Test") { results in
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



    @IBAction func createTransferToExistingBeneficiary(_ sender: UIButton) {
        guard let connection = selectedConnection else {
            showMessage("Please select bank connection first to be used in this API")
            return
        }

        Dapi.shared.bankAccounts(bankConnection: connection) { results in
            switch results {
            case .success(let accountsResponse):
                Dapi.shared.bankBeneficiaries(bankConnection: connection) { results in
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

}
extension ViewController: DAPIAutoFlowDelegate {

    func autoFlow(_ autoFlow: DAPIAutoFlowVC,
                  willTransferAmount amount: Float,
                  fromAccount senderAccount: DAPIBankAccount) {
        print(#function)

    }

    func autoFlow(_ autoFlow: DAPIAutoFlowVC,
                  transferDidFailFrom senderAccount: DAPIBankAccount?,
                  with error: Error) {
        print(error.dapiErrorMessage)

    }

    func autoFlow(_ autoFlow: DAPIAutoFlowVC,
                  transferDidSuccessFrom senderAccount: DAPIBankAccount,
                  transferResult: DAPITransferResult) {
        print(transferResult.referenceNumber)
        print(transferResult.remark)
    }

    func autoFlowUserDidCanceled(_ autoFlow: DAPIAutoFlowVC) {
        print(#function)

    }

}
