// 66. Plus One
// You are given a large integer represented as an integer array digits, where each digits[i] is the ith digit of the integer. The digits are ordered from most significant to least significant in left-to-right order. The large integer does not contain any leading 0's.
// Increment the large integer by one and return the resulting array of digits.

import XCTest

fileprivate
class Solution {
    static func plusOne(_ digits: [Int]) -> [Int] {
        if digits.count == 1 {
            if digits[0] == 9 {
                return [1, 0]
            } else {
                return [digits[0] + 1]
            }
        } else {
            var temp = digits
            let maxIndex = digits.count - 1
            var i = maxIndex
            
            while i >= 0 {
                let current = digits[i]
                
                if current == 9 && i == 0 {
                    temp[i] = 0
                    temp.insert(1, at: 0)
                } else if current == 9 {
                    temp[i] = 0
                } else {
                    temp[i] = temp[i] + 1
                    return temp
                }
                i -= 1
            }
            
            return temp
        }
    }
}

fileprivate
final class SolutionTestCase: XCTestCase {
    func testSimple() throws {
        XCTAssertEqual(Solution.plusOne([1, 2, 3]), [1, 2, 4])
        XCTAssertEqual(Solution.plusOne([4, 3, 2, 1]), [4, 3, 2, 2])
        XCTAssertEqual(Solution.plusOne([1, 2, 3, 9]), [1, 2, 4, 0])
    }
    
    func testShift() throws {
        XCTAssertEqual(Solution.plusOne([9]), [1, 0])
        XCTAssertEqual(Solution.plusOne([9, 9]), [1, 0, 0])
    }
    
    func testBigNumbers() throws {
        let before = [7,2,8,5,0,9,1,2,9,5,3,6,6,7,3,2,8,4,3,7,9,5,7,7,4,7,4,9,4,7,0,1,1,1,7,4,0,0,6]
        let after = [7,2,8,5,0,9,1,2,9,5,3,6,6,7,3,2,8,4,3,7,9,5,7,7,4,7,4,9,4,7,0,1,1,1,7,4,0,0,7]
        XCTAssertEqual(Solution.plusOne(before), after)
    }
    
    func testBigNumbersWithShift() throws {
        let before = [7,2,8,5,0,9,1,2,9,5,3,6,6,7,3,2,8,4,3,7,9,5,7,7,4,7,4,9,4,7,0,1,1,1,7,4,0,0,9]
        let after = [7,2,8,5,0,9,1,2,9,5,3,6,6,7,3,2,8,4,3,7,9,5,7,7,4,7,4,9,4,7,0,1,1,1,7,4,0,1,0]
        XCTAssertEqual(Solution.plusOne(before), after)
    }
}
