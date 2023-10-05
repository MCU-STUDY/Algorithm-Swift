//
//  3진법 뒤집기.swift
//  algo-swift-MCU
//
//  Created by 김민재 on 10/5/23.
//

import Foundation

func solution(_ n:Int) -> Int {
    // String을 reversed하게 되면 얻게 되는 타입은 ReversedCollection타입.
    // ReversedCollection<Base>의 Base, 제네릭으로 String으로 들어가게 되고
    // 제네릭은 BidirectionCollection protocol을 준수하고 있으며 해당 프로토콜은 Collection protocol을 준수하고 있다.
    // 따라서 String은 Collection protocol을 준수하고 있음을 알 수 있다.
    return Int(String(String(n, radix: 3).reversed()), radix: 3)!
}
