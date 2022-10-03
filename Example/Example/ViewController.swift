//
//  ViewController.swift
//  Example
//
//  Created by MSZ on 03/10/2022.
//

import UIKit
import DapiSDK

class ViewController: UIViewController {

    var selectedConnection: DAPIBankConnection?
    var bankConnectionParams = [
        "userID": "U6Kx3/if3Ko7FDg9ypVoZmzzEWFMzrsVjVA/PNYoyiPF8HGl0CvaSpgnsnVep49H8D2pDEROAc3L24P+s6ZfrQ==",
        "tokenID": "f6335219-7466-44ef-8031-22e9739315cd",
        "connectionID": "a6479d32-d062-41f6-abea-0f374ed7d677",
        "clientUserID": "JohnDoe",
        "userSecret": "FhZ3gk9wSATykhqoawXaQg7/EdTltIThbQcmLVFV8rr6fwWbvYkTyW4an9d/6zLS+dFRzxuE2GGfxix9ZztWY+KVZXmQ11tRQgfQUTbrFr7WQdoWQnPjWFCDO7SoYZ4udsJAGcmLyxX7B/3maKGv3TDqLo+x9pK+3wKQQGnopO8UtP/t0Rocj1hJU98s5p5SaGr/BfsQwltjGvmfyFYFOyY1C7Q9dkm2VcYfKgqXnF4qFuLf2tU4X0h5uzjKBkJWMA707ARvcV2FUCbOQEw48AzD5fK9x2+prKQ3V8qHMLqWcMKGEPIfB5irQBRKZBR0b4btJGjgJ2WbF+jZPzLktbjthfayL8e5mTUWRvHfVkL86GRjZM2NHXbUI1D13jUZgI4UC9fHcQht/A6t36gjVZb7oY//GKwBDoPkkcsXNoIjlnpgO4Wr7NXM5XPveVbzHjmNjhs94p7bqSXbaQgoZSSS2ipJc3r9ezmT4s95SauXbKisFFhWJp42glio52eI68V7KWUE62P17TePytjlzZUTZa9g7vcN30ogQEYP3nbQmGmrlQ4fHjJzjuG2rHd3LAuQK/k5xaSd43xNFWXkn8mrCGFWXdAKedyxdyuUW9YnkNnUaYnJUq+smEU47PkxPAn5SNCfLqIP+X9eEpTcYj/O2vK7IhLnnFnT9cLSOP0=",
        "bankId": "DAPIBANK_AE_ENBD",
        "name": "ENBD"

    ] as [String: Any]

    var dapiBeneficiary: DAPIBeneficiary {
        var lineAddress = DAPILineAddress()
        lineAddress.line1 = "2400 bruce street UCA stadium park bld 6"
        lineAddress.line2 = ""
        lineAddress.line3 = ""
        var beneficiary =  DAPIBeneficiary()
        beneficiary.linesAddress =  lineAddress
        beneficiary.accountNumber = "1647518280840289401662"
        beneficiary.bankName = "STANDARD CHARTERED BANK"
        beneficiary.swiftCode = "SCBLAEAD"
        beneficiary.iban = "DAPIBANKAEHSBC1647518280840289401662"
        beneficiary.country = "AE"
        beneficiary.branchAddress = "Dubai Mall"
        beneficiary.branchName = "Dubai Mall"
        beneficiary.phoneNumber = "0585859206"
        beneficiary.name = "Magdy Zamel"
        return beneficiary
    }
}



extension ViewController{
    func showMessage(_ message : String){
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
    }

}
