//
//  1927_최소힙.swift
//  algo-swift-MCU
//
//  Created by 김민재 on 10/3/23.
//

import Foundation

final class Heap {
    var elements: [Int] = []

    func insert(element: Int) {
        elements.append(element)
        siftUp(index: elements.count - 1)
    }

    func removeMax() -> Int {
        if elements.isEmpty { return 0 }
        elements.swapAt(0, elements.count - 1)
        let removed = elements.popLast()
        siftDown(index: 0)
        return removed == nil ? 0 : removed!
    }

    private func siftUp(index: Int) {
        var index = index
        var parentIdx = parent(of: index)

        while parentIdx >= 0 && elements[parentIdx] > elements[index]  {
            elements.swapAt(parentIdx, index)

            index = parentIdx
            parentIdx = parent(of: parentIdx)
        }
    }

    private func siftDown(index: Int) {
        var index = index
        var left = leftChild(of: index)
        var right = rightChild(of: index)

        guard var prior = getPriorChild(left: left, right: right) else{
            return
        }

        while elements[prior] < elements[index] {

            elements.swapAt(prior, index)

            index = prior

            left = leftChild(of: index)
            right = rightChild(of: index)

            guard let pr = getPriorChild(left: left, right: right) else { return }

            prior = pr
        }

    }

    private func getPriorChild(left: Int, right: Int) -> Int? {
        if left >= elements.count { return nil } // 자식 X
        else if right >= elements.count { // 왼쪽자식만 O
            return left
        } else { // 모든 자식 있는 경우
            if elements[left] < elements[right] {
                return left
            } else {
                return right
            }
        }
    }

    private func parent(of index: Int) -> Int {
        return (index - 1) / 2
    }

    private func leftChild(of index: Int) -> Int {
        return 2 * index + 1
    }

    private func rightChild(of index: Int) -> Int {
        return 2 * index + 2
    }

}


let N = Int(readLine()!)!
var heap = Heap()
for _ in 0..<N {
    let input = Int(readLine()!)!
    if input == 0 {
        print(heap.removeMax())
        continue
    }

    heap.insert(element: input)
}

