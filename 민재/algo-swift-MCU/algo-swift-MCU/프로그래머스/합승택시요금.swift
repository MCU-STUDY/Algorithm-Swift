import Foundation

struct PathWeight {
    let destination: Int
    let weight: Int
    
    init(_ destination: Int, _ weight: Int) {
        self.destination = destination
        self.weight = weight
    }
}

final class Heap {
    private var elements: [PathWeight] = []

    var isEmpty: Bool {
        return elements.isEmpty
    }

    func insert(_ pw: PathWeight) {
        elements.append(pw)
        siftUp(start: elements.count - 1)
    }

    func removeFirst() -> PathWeight? {
        elements.swapAt(0, elements.count - 1)
        let rev = elements.popLast()
        siftDown(start: 0)
        return rev
    }

    func parent(of r: Int) -> Int {
        return (r - 1) / 2
    }

    func leftChildIndex(of r: Int) -> Int {
        return 2 * r + 1
    }

    func rightChildIndex(of r: Int) -> Int {
        return 2 * r + 2
    }

    private func siftUp(start: Int) {
        let parentIndex = parent(of: start)
        if parentIndex < 0 { return }

        if elements[parentIndex].weight > elements[start].weight {
            elements.swapAt(parentIndex, start)
            siftUp(start: parentIndex)
        }
    }

    private func siftDown(start: Int) {
        let leftChildIdx = leftChildIndex(of: start)
        let rightChildIdx = leftChildIdx + 1

        guard let chosen = getMinNode(left: leftChildIdx, right: rightChildIdx) else {
            return
        }

        if elements[chosen].weight < elements[start].weight {
            elements.swapAt(chosen, start)
            siftDown(start: chosen)
        }
    }

    private func getMinNode(left: Int, right: Int) -> Int? {
        let n = elements.count

        if left >= n && right >= n { return nil }
        else if left >= n { return right }
        else if right >= n { return left }

        if elements[left].weight < elements[right].weight {
            return left
        } else {
            return right
        }
    }
}

// 지점의 개수, 출발지점 s, A 도착, B 도착, 지점 사이의 택시요금
func solution(_ n:Int, _ s:Int, _ a:Int, _ b:Int, _ fares:[[Int]]) -> Int {
    // 양방향이다.
    // BFS , backtracking, dijkstra ? => 다익스트라로 푸는 문제임
    var adj: [[PathWeight]] = Array(repeating: [], count: n+1)
    for fare in fares {
        let c = fare[0]
        let d = fare[1]
        let f = fare[2]
        
        adj[c].append(PathWeight(d, f))
        adj[d].append(PathWeight(c, f)) // 양방향
        
    }
    
    // dijkstra
    var dist = Array(repeating: Int.max, count: n+1)
    var visited = Array(repeating: false, count: n+1)

    dist[s] = 0
    visited[s] = true

    var heap = Heap()
    heap.insert(PathWeight(s, 0))

    while !heap.isEmpty {
        if let node = heap.removeFirst()?.destination {
            visited[node] = true

            for v in adj[node] {
                if !visited[v.destination] &&
                dist[v.destination] > dist[node] + v.weight {
                    dist[v.destination] = dist[node] + v.weight
                    heap.insert(PathWeight(v.destination, dist[v.destination]))
                }
            }
        }
    }
    // s
    // print(dist)
    // print(dist[start])
    // print(dist[a])
    // print(dist[b])
    // print(dist[s])
    // print("=============")
    var ans = dist[a] + dist[b] // 각각 따로 가는 경우를 미리 세팅
    // print("ans = ", ans)
    // print(dist)
    for start in 1...n {
        // print("start == ", start)
        if start == s || dist[start] == Int.max { continue }
        
        let sToStart = dist[start]
        // print("s to start ", sToStart)
        
        var dist = Array(repeating: Int.max, count: n+1)
        var visited = Array(repeating: false, count: n+1)

        dist[start] = 0
        visited[start] = true

        var heap = Heap()
        heap.insert(PathWeight(start, 0))

        while !heap.isEmpty {
            if let node = heap.removeFirst()?.destination {
                visited[node] = true

                for v in adj[node] {
                    if !visited[v.destination] &&
                    dist[v.destination] > v.weight + dist[node] {
                        dist[v.destination] = v.weight + dist[node]
                        heap.insert(PathWeight(v.destination, dist[v.destination]))
                    }
                }
            }
        }
        
//         print(dist)
        // let a = dist[a]
        // let b = dist[b]
        // print("hh = ", sToStart + a + b)
        // print(dist[a])
        // print(dist[b])
        ans = min(sToStart + dist[a] + dist[b], ans)
    }
    
    
    // print("ans = ", ans)
    
    return ans
}
