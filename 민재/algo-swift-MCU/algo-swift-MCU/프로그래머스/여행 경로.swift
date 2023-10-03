//
//  여행 경로.swift
//  algo-swift-MCU
//
//  Created by 김민재 on 10/3/23.
//

import Foundation

func solution(_ tickets:[[String]]) -> [String] {

    var tickets: [[String]] = tickets.sorted { a, b in
                                              a[1] < b[1]

    }


    var ticketUsed = Array(repeating: false, count: tickets.count)


    var path: [String] = ["ICN"]

    func dfs(_ start: String) {

        if path.count == tickets.count + 1 {
            return
        }

        for i in 0..<tickets.count {
            if !ticketUsed[i] && tickets[i][0] == start {
                ticketUsed[i] = true // ticket used !
                let ticket = tickets[i]
                path.append(ticket[1])

                dfs(ticket[1])
                if path.count == tickets.count + 1 {
                    return
                }

                path.popLast()
                ticketUsed[i] = false // bt
            }
        }
    }

    dfs("ICN")


    return path
}
