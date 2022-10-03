//
//  ViewController + PaymentAPIs.swift
//  Example
//
//  Created by MSZ on 03/10/2022.
//

import DapiSDK
import UIKit

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
