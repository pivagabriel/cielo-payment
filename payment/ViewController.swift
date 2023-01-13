//
//  ViewController.swift
//  payment
//
//  Created by Gabriel Muniz Piva on 10/01/23.
//

import UIKit
import Braspag3Ds
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var expirationYearTextField: UITextField!
    @IBOutlet weak var expirationMonthTextField: UITextField!
    @IBOutlet weak var cardNumberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        [cardNumberTextField, expirationMonthTextField, expirationYearTextField].forEach{field in
            field!.delegate = self
        }
    }
    
    @IBAction func onButtonClicked(_ sender: UIButton) {
        getToken()
    }
    
    func getToken() {
        let headers: HTTPHeaders = [.authorization("Bearer ZGJhM2E4ZGItZmE1NC00MGUwLThiYWItN2JmYjliNmYyZTJlOkQvaWxSc2ZvcUhsU1VDaHdBTW5seUtkRE5kN0ZNc003Y1Uvdm8wMlJFYWc9")]
        let parameters: [String: Any] = ["EstablishmentCode": "1006993069",
                                        "MerchantName": "Loja Exemplo Ltda",
                                        "MCC": "5912"]
    
        AF.request("https://mpisandbox.braspag.com.br/v2/auth/token", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .responseDecodable(of: CieloData.self) { response in
                if let token = response.value?.access_token {
                    self.paymentRequest(token: token)
                } else {
                    print("Não foi possível obter o token")
                }
        }
    }
    
    func paymentRequest(token: String) {
        let cardNumber: String = cardNumberTextField.text ?? ""
        let expirationMonth: String = expirationMonthTextField.text ?? ""
        let expirationYear: String = expirationYearTextField.text ?? ""
        
        let braspag3ds = Braspag3ds(accessToken: token, environment: Environment.sandbox)
        braspag3ds.authenticate(
            orderData: OrderData(orderNumber: "123456", currencyCode: "BRL", totalAmount: 10, paymentMethod: .debit, transactionId: nil, installments: nil, recurrence: nil, productCode: nil, countLast24Hours: nil, countLast6Months: nil, countLast1Year: nil, cardAttemptsLast24Hours: nil, marketingOptIn: nil, marketingSource: nil, transactionMode: nil, merchantUrl: nil),
            cardData: Braspag3Ds.CardData(number: cardNumber, expirationMonth: expirationMonth, expirationYear: expirationYear, cardAlias: nil, defaultCard: nil),
            authOptions: OptionsData(notifyOnly: false, suppressChallenge: false),
            billToData: nil,
            shipToData: nil,
            cart: nil,
            deviceData: nil,
            userData: nil,
            airlineData: nil,
            mdd: nil,
            recurringData: nil,
            deviceIpAddress: nil) { (status, authenticationResponse, string)  in
                print(status)
                print(authenticationResponse)
                print(string)
            }
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (textField == expirationYearTextField) {
            let maxLength = 4
            let currentString: NSString = (textField.text ?? "") as NSString
            let newString: NSString =  currentString.replacingCharacters(in: range, with: string) as NSString
            
            let hexSet = CharacterSet(charactersIn: "0123456789")
            let newSet = CharacterSet(charactersIn: newString as String)
            
            return newString.length <= maxLength && hexSet.isSuperset(of: newSet)
        }
        
        if (textField == expirationMonthTextField) {
            let maxLength = 2
            let currentString: NSString = (textField.text ?? "") as NSString
            let newString: NSString =  currentString.replacingCharacters(in: range, with: string) as NSString
            
            let hexSet = CharacterSet(charactersIn: "0123456789")
            let newSet = CharacterSet(charactersIn: newString as String)
            
            return newString.length <= maxLength && hexSet.isSuperset(of: newSet)
        }
        
        if (textField == cardNumberTextField) {
            let maxLength = 16
            let currentString: NSString = (textField.text ?? "") as NSString
            let newString: NSString =  currentString.replacingCharacters(in: range, with: string) as NSString
            
            let hexSet = CharacterSet(charactersIn: "0123456789")
            let newSet = CharacterSet(charactersIn: newString as String)
            
            return newString.length <= maxLength && hexSet.isSuperset(of: newSet)
        }
        
        return true
    }
}


struct CieloData: Decodable {
    let access_token: String
    let token_type: String
}
