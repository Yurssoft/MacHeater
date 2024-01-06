import Foundation
import XCTest

//♨️♨️♨️♨️♨️♨️♨️♨️♨️♨️♨️♨️♨️♨️♨️♨️♨️♨️♨️♨️♨️♨️♨️♨️♨️♨️♨️♨️♨️♨️♨️♨️♨️♨️♨️♨️
final class MegaHeatingComputingTests: XCTestCase {
    
    // Amazingly complex swift compilation stuff
    public let __tmp0 = 2 * 2 * 2 * 2.0 / 2 + 2
    public let __tmp1 = 2 * 2 * 2 * 2.0 / 2 + 2
    public let __tmp2 = 2 * 2 * 2 * 2.0 / 2 + 2
    public let __tmp3 = 2 * 2 * 2 * 2.0 / 2 + 2
    public let __tmp4 = 2 * 2 * 2 * 2.0 / 2 + 2
    public let __tmp5 = 2 * 2 * 2 * 2.0 / 2 + 2
    public let __tmp6 = 2 * 2 * 2 * 2.0 / 2 + 2
    public let __tmp7 = 2 * 2 * 2 * 2.0 / 2 + 2
    public let __tmp8 = 2 * 2 * 2 * 2.0 / 2 + 2
    public let __tmp9 = 2 * 2 * 2 * 2.0 / 2 + 2
    
    let intBinaryOpsDict: [String : (Int, Int) -> Int] = [
        "add" : (+),
        "sub" : (-),
        "mul" : (*),
        "div" : (/)
    ]
    
    let sum = [1, 2, 3].map { String($0) }.compactMap { Int($0) }.reduce(0, +)
    let sum1 = [1, 2, 3, 4, 5, 6, 7, 8]
        .map { String($0) }
        .compactMap { Int($0) }
        .reduce(0, +)
    
    let sum2 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
        .compactMap { UInt($0) }
        .map { $0 - 0 }
        .reduce(0, +)
    
    let sum3 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
        .compactMap { Float($0) }
        .compactMap { Int($0) }
        .reduce(0, +)
    
    /// Invokes each test with large number of times
    override func invokeTest() {
        for time in 0...Int.max {
            print("Test is being invoked: \(time) times")
            super.invokeTest()
        }
    }
    
    class MemoryContainer {
        init() {
            var values = [String]()
            for number in 0...99 {
                for numberInside in 0...3 {
                    values.append("\(number) \(numberInside) \(Double.infinity)")
                }
            }
            container.append(contentsOf: values)
        }
        
        var container: [String] = []
    }
    
    /// Creates extensive thread and memory numbers
    /// It creates a lot of threads and floads CPU with paralel tasks
    /// CPU spends more time switching between threads rather than performing actual work
    /// This test easily creates 1000+ threads in few seconds
    func testOverflowingThreadPool() {
        var containers = [MemoryContainer]()
        var threads = [Thread]()
        
        let memoryLoadThread = Thread {
            for _ in 0...Int.max {
                for _ in 0...Int.max {
                    let container = MemoryContainer()
                    container.container.append(Blob.stringBlob)
                    containers.append(container)
                }
            }
        }
        threads.append(memoryLoadThread)
        
        for number in 0...Int.max {
            let container = MemoryContainer()
            let thread = Thread {
                print("Printing \(number)")
                container.container.append("\(Double.infinity)")
            }
            thread.start()
            threads.append(thread)
            let thread2 = Thread {
                containers.append(container)
            }
            threads.append(thread2)
            thread2.start()
        }
        for thread in threads {
            print(" \(thread) \(thread.isFinished)")
        }
        XCTAssertTrue(containers.count > 0)
        XCTAssertTrue(threads.count > 0)
    }
    
    /// Uses impossible to calculate result in worst case
    /// Kind of infinite loop with exploding memory
    func testAllConstruct() {
        // not optimized dynamic programming algorithm to count worst case with big output that should fail
        func allConstruct(_ target: String, _ wordBank: [String]) -> [[String]] {
            if target.isEmpty { return [[]] }
            var allPossibleWaysToConstruct = [[String]]()
            for word in wordBank {
                if target.hasPrefix(word) {
                    let suffixRemainder = target.dropFirst(word.count)
                    var allWays = allConstruct(String(suffixRemainder), wordBank)
                    if !allWays.isEmpty {
                        if allWays[0].isEmpty {
                            allWays[0] = [word]
                        } else {
                            allWays[0].insert(word, at: 0)
                        }
                        print(__tmp0, __tmp1, __tmp2, __tmp3, __tmp4, __tmp5, __tmp6, __tmp7, __tmp8, __tmp9, intBinaryOpsDict, sum, sum1, sum2, sum3)
                        allPossibleWaysToConstruct.insert(contentsOf: allWays, at: 0)
                    }
                }
            }
            return allPossibleWaysToConstruct
        }
        
        runTestCases(closure: { allConstruct($0, $1) })
    }
    
    func runTestCases(closure: (String, [String]) -> [[String]]) {
        XCTAssertEqual(closure("purple", ["purp","p","ur","le","purpl"]), [["p","ur","p","le"],["purp","le"]])
        XCTAssertEqual(closure("lax", ["la","x"]), [["la","x"]])
        XCTAssertEqual(closure("skateboard", ["bo","rd","ate","t","ska","sk","boar"]), [])
        XCTAssertEqual(closure("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee",
                               ["e",
                                "ee",
                                "eee",
                                "eeee",
                                "eeeee",
                                "eeeeee",
                                "eeeeeee",
                                "eeeeeeee",
                                "eeeeeeeee",
                                "eeeeeeeeee",
                                "eeeeeeeeeee",
                                "eeeeeeeeeeee",
                                "eeeeeeeeeeeee",
                                "eeeeeeeeeeeeee",
                                "eeeeeeeeeeeeeee",
                                "eeeeeeeeeeeeeeee",
                                "eeeeeeeeeeeeeeeee",
                                "eeeeeeeeeeeeeeeeee",
                                "eeeeeeeeeeeeeeeeeee",
                                "eeeeeeeeeeeeeeeeeeee",
                                "eeeeeeeeeeeeeeeeeeeee",
                                "eeeeeeeeeeeeeeeeeeeeee",
                                "eeeeeeeeeeeeeeeeeeeeeee",
                                "eeeeeeeeeeeeeeeeeeeeeeee",
                                "eeeeeeeeeeeeeeeeeeeeeeeee",
                                "eeeeeeeeeeeeeeeeeeeeeeeeee",
                                "eeeeeeeeeeeeeeeeeeeeeeeeeee",
                                "eeeeeeeeeeeeeeeeeeeeeeeeeeee",
                                "eeeeeeeeeeeeeeeeeeeeeeeeeeeee",
                                "eeeeeeeeeeeeeeeeeeeeeeeeeeeeee",
                                "eeeeeeeeeeeeeeeeeeeeeeeeeeeeeee",
                                "eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee",
                                "eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee",
                                "eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee",
                                "eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee",
                                "eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee",
                                "eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee",
                                "eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee",
                                "eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee",
                                "eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee",
                                "eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee",
                                "eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee",
                                "eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee",
                                "eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee"]), [])
    }
}
