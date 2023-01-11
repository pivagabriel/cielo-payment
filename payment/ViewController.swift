//
//  ViewController.swift
//  payment
//
//  Created by Gabriel Muniz Piva on 10/01/23.
//

import UIKit
import Braspag3Ds

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onButtonClicked(_ sender: UIButton) {
        let braspag3ds = Braspag3ds(accessToken: "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6ImJWS0RGb1dIRTVha0szeXNqSjJScGpxZFZlRSJ9.eyJjbGllbnRfbmFtZSI6IlFBXzNEU19BdXRoZW50aWNhdG9yIiwiY2xpZW50X2lkIjoiZGJhM2E4ZGItZmE1NC00MGUwLThiYWItN2JmYjliNmYyZTJlIiwic2NvcGVzIjoie1wiU2NvcGVcIjpcIkJyYXNwYWczRFNBdXRoZW50aWNhdG9yXCIsXCJDbGFpbXNcIjpbe1wiTmFtZVwiOlwiTWVyY2hhbnROYW1lXCIsXCJWYWx1ZXNcIjpbXCJMb2phIEV4ZW1wbG8gTHRkYVwiXX0se1wiTmFtZVwiOlwiRXN0YWJsaXNobWVudENvZGVcIixcIlZhbHVlc1wiOltcIjEwMDY5OTMwNjlcIl19LHtcIk5hbWVcIjpcIk1DQ1wiLFwiVmFsdWVzXCI6W1wiNTkxMlwiXX0se1wiTmFtZVwiOlwiUmVmZXJlbmNlSWRcIixcIlZhbHVlc1wiOltcImM5NTUyZmI5LWI4ZmYtNDRkOS1hMTMwLTEyMjY1NTg3ODhhMFwiXX1dfSIsImlzcyI6Imh0dHBzOi8vYXV0aHNhbmRib3guYnJhc3BhZy5jb20uYnIiLCJhdWQiOiJVVlF4Y1VBMmNTSjFma1EzSVVFbk9pSTNkbTl0Zm1sNWVsQjVKVVV1UVdnPSIsImV4cCI6MTY3MzUyMjUyOSwibmJmIjoxNjczNDM2MTI5fQ.YJYEzveSSWa2LQk-Omp4MD3ts4yVcWIxStB8rQpB7zfX9VOol5qvtiL0MMYzGpgmLZzK6sK77IdW0Rayg7AilO3proMqChEWSYH_5NjLID7k0nrKxryIHzNQqaR3BPayK7UAIPDQkj0sIyFHddZkS4tkGnDF6uxi_Y354G6LHmDThsVNvPx7Xbq7-iGYo68VaQim5si-kQicqjoPwXbhYMR7s0XlFAIDYdGlNZQAUYspzgYsEX7QCJLrZMr8wP4EaL6IisvsJODvsYODpc8Xdq6pWeaU56FhWhJjxGflyW5aIKWSJe4ZHoilLjhVxpS2iBAHp3OXlOJ0EmmSR24sUQ", environment: Environment.sandbox)
               
            braspag3ds.authenticate(
                orderData: OrderData(orderNumber: "123456", currencyCode: "BRL", totalAmount: 10, paymentMethod: .debit, transactionId: nil, installments: nil, recurrence: nil, productCode: nil, countLast24Hours: nil, countLast6Months: nil, countLast1Year: nil, cardAttemptsLast24Hours: nil, marketingOptIn: nil, marketingSource: nil, transactionMode: nil, merchantUrl: nil),
                cardData: Braspag3Ds.CardData(number: "4000000000001091", expirationMonth: "07", expirationYear: "2023", cardAlias: nil, defaultCard: nil),
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

