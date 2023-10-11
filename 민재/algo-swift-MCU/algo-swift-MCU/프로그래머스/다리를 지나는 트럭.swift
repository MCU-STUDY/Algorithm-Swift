//
//  다리를 지나는 트럭.swift
//  algo-swift-MCU
//
//  Created by 김민재 on 10/11/23.
//

import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var trucks = truck_weights
    var bridge = Array(repeating: 0, count: bridge_length)
    var crossed = 0
    var currW = 0
    var time = 0
    while crossed != truck_weights.count {
        time += 1
        let pop = bridge.removeFirst()
        if pop != 0 {
            currW -= pop
            crossed += 1
        }

        if trucks.isEmpty {
            continue
        }

        if trucks[0] + currW <= weight {
            currW += trucks[0]
            bridge.append(trucks[0])
            trucks.removeFirst()
        } else {
            bridge.append(0)
        }



    }


    return time
}
