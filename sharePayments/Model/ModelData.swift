//
//  ModelData.swift
//  sharePayments
//
//  Created by Alexey on 21.06.2020.
//  Copyright © 2020 Alexey Okhin. All rights reserved.
//

import Foundation

/*// var myConsolidArray = ["Ant": 245.0, "Irt": 123.0, "ivan": 0.0, "Stas": 178.0]
print (myConsolidArray)
let totalPay = myConsolidArray.reduce(0, { $0 + $1.1 })
print (totalPay)

let eqPay = (totalPay / Double(myConsolidArray.count))
print(eqPay)

let tmpArray = myConsolidArray.map{ name,pay in
    (name,eqPay - pay)
}
print (tmpArray)

var debtorsArray = tmpArray.filter{name,pay in pay > 0}
print (debtorsArray)

var lendersArray = tmpArray.filter{name,pay in pay < 0}
print (lendersArray)

var lender = lendersArray[0]
var debtor = debtorsArray[0]
var values = [String]()
var delta = 0.0

while (Double(lendersArray.count) > 0.0 && Double(debtorsArray.count) > 0.0) {
    if lender.1 == 0 {
        lender = lendersArray[0]
    }
    if debtor.1 == 0 {
        debtor = debtorsArray[0]
    }
    
    delta = debtor.1 + lender.1
    
    if (delta < 0.0) {
        values.append("Должник:\(debtor.0) отдает :\(lender.0) сумму :\(debtor.1)")
        lender.1 += debtor.1
        debtor.1 = 0.0
    } else {
        values.append("Должник:\(debtor.0) отдает :\(lender.0) сумму :\(-lender.1)")
        debtor.1 += lender.1
        lender.1 = 0.0
    }
    
    if (debtor.1 == 0.0) {
        debtorsArray.remove(at: 0)
        //debtor =
    }
    if (lender.1 == 0.0) {
        lendersArray.remove(at: 0)
        //lender = nil
    }
    
    delta = 0.0
}

mesageLabel.text = ("""
    Общая сумма: \(totalPay)
    средний платеж = \(eqPay)
    расплата \(values)
    """)
//  print(values)
//  print(totalPay)
//  print(eqPay)

}
*/
