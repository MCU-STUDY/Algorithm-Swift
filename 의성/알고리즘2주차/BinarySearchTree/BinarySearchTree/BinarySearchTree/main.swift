//
//  main.swift
//  BinarySearchTree
//
//  Created by uiskim on 2023/08/17.
//

import Foundation

final class BinarySearchTreeNode {
    var leftNode: BinarySearchTreeNode?
    var data: Int
    var rightNode: BinarySearchTreeNode?
    
    init(_ data: Int) {
        self.data = data
    }
}

final class BinarySearchTree {
    var rootNode: BinarySearchTreeNode?
    
    func insert(_ data: Int) {
        /// rootNode가 nil일때(첫 Node를 넣어주는 상황일때)
        guard let rootNode else {
            rootNode = BinarySearchTreeNode(data)
            /// rootNode를 넣어주고 함수를 종료한다
            return
        }
        
        var currentNode = rootNode
        while true {
            /// 넣고싶은 data가 현재Node의 data보다 작은경우(왼쪽 노드로 가야함)
            if currentNode.data > data {
                guard let nextLeftNode = currentNode.leftNode else {
                    currentNode.leftNode = BinarySearchTreeNode(data)
                    return
                }
                currentNode = nextLeftNode
                
            /// 넣고싶은 data가 현재Node의 data보다 큰경우(오른쪽 노드로 가야함)
            } else {
                guard let nextRightNode = currentNode.rightNode else {
                    currentNode.rightNode = BinarySearchTreeNode(data)
                    return
                }
                currentNode = nextRightNode
            }
        }
    }
    
    /// Node를 제거할때는 세가지 케이스를 고려해야한다
    /// 1. 자녀 노드가 없는 경우
    /// 2. 자녀 노드가 한개인 경우
    /// 3. 자녀 노드가 두개인 경우
    @discardableResult
    func remove(_ removeData: Int) -> Bool {
        /// Node제거의 경우, 부모노드와 현재노드를 알아야 reference를 바꿀수있기때문에 부모노드와 현재노드를 알아야한다
        /// 아이디어
        /// 1. 끝까지 loop를 돌아야한다(내가 보고있는 Node가 nil일때까지)
        /// 2. data를 찾으면 loop를 끝낸다(break)
        
        guard let rootNode else { return false }
        var parentNode: BinarySearchTreeNode = rootNode
        var currentNode: BinarySearchTreeNode? = rootNode
        
        /// 내가 바라보고있는 Node를 currentNode로 설정해준다
        while let nodeYouSee = currentNode {
            if nodeYouSee.data == removeData { break }
            /// 내가 보고있는 Node의 데이터에 따라 다음 내가볼 노드를 결정해준다
            if nodeYouSee.data > removeData {
                currentNode = nodeYouSee.leftNode
            } else {
                currentNode = nodeYouSee.rightNode
            }
            /// 다음노드로 가야하니까 지금내가 보고있는 노드가 parent노드가 된다
            parentNode = nodeYouSee
        }
        
        /// nil이 되어도 while문이 끝나고 data가 같아도 while문이 끝남
        /// 총 두가지 경우가 존재함 nil인경우(데이터가 없음)와 데이터를 찾은경우
        /// 이 두가지를 분기해줘야 비로소 delete할 Node가 결정됨
        guard let deleteNode = currentNode else { return false }
        
        /// 1. 자녀 노드가 없는 경우
        /// 부모노드의 data와 deleteNode의 data를 비교해서 LeftNode를 지울지 RightNode를 지울지 결정해준다
        if deleteNode.leftNode == nil && deleteNode.rightNode == nil {
            if parentNode.data > removeData {
                parentNode.leftNode = nil
            } else {
                parentNode.rightNode = nil
            }
            return true
        }
        
        /// 2. 자녀 노드가 한개인 경우
        /// 다음노드랑 parent노드랑 연결해야한다
        /// 2-1 자녀노드가 왼쪽에 한개인 경우(parentNode의 왼쪽인지 오른쪽인지는 모름)
        if deleteNode.leftNode != nil && deleteNode.rightNode == nil {
            if parentNode.data > removeData {
                parentNode.leftNode = deleteNode.leftNode
            } else {
                parentNode.rightNode = deleteNode.leftNode
            }
            return true
        }
        
        if deleteNode.rightNode != nil && deleteNode.leftNode == nil {
            if parentNode.data > removeData {
                parentNode.leftNode = deleteNode.rightNode
            } else {
                parentNode.rightNode = deleteNode.rightNode
            }
            return true
        }
        
        /// 3. 자녀 노드가 두개인 경우
        /// 오른쪽 노드를 시작점으로 해야하기때문에 찾는다
        guard let rightNode = deleteNode.rightNode else { return false }
        var changeNode = rightNode
        var changeParentNode = rightNode

        /// 오른쪽 노드부터 왼쪽노드가 nil이 될때까지 찾으면 된다
        /// changeNode에는 삭제하려는 노드 오른쪽에서 가장 작은 data를 가지고 있는 Node
        /// changeParentNode는 changeNode의 parent를 가리키게된다
        while let rightSideNodeWithSmallestData = changeNode.leftNode {
            changeParentNode = changeNode
            changeNode = rightSideNodeWithSmallestData
        }
        
        if changeNode.data == changeParentNode.data {
            parentNode.rightNode = changeNode
            changeNode.leftNode = deleteNode.leftNode
            return true
        }
        

        if let rightNode = changeNode.rightNode {
            changeParentNode.leftNode = rightNode
        } else {
            changeParentNode.leftNode = nil
        }



        if parentNode.data > changeNode.data {
            parentNode.leftNode = changeNode
        } else {
            parentNode.rightNode = changeNode
        }
        
        changeNode.leftNode = deleteNode.leftNode
        changeNode.rightNode = deleteNode.rightNode
        
        return true
    }
}


var testTree = BinarySearchTree()
testTree.insert(35)
testTree.insert(10)
testTree.insert(40)
testTree.insert(7)
testTree.insert(30)
testTree.insert(25)
testTree.insert(33)
testTree.insert(16)
testTree.insert(28)
testTree.insert(34)
testTree.insert(18)

//testTree.remove(10)
//testTree.remove(30)
//testTree.remove(32)
//testTree.remove(31)
//testTree.remove(33)
//testTree.remove(16)
//testTree.remove(25)
testTree.rootNode?.asString()

//testTree.printPreorderResult()
//testTree.printInorderResult()
//testTree.printPostorderResult()




