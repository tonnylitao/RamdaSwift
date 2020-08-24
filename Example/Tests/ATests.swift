import XCTest
@testable import Ramda

class Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAdd() {
        let output = 1 + 2
        
        XCTAssertEqual(R.add(1, 2), output)
        
        XCTAssertEqual(R.curry(R.add)(1)(2), output)
        
        XCTAssertEqual(R.add(R.__, 2)(1), output)
        XCTAssertEqual(R.add(1, R.__)(2), output)
    }
    
    func testAddIndex() {
        let f: (Int, String) -> String = { "\($0) - \($1)" }
        let list = ["f", "o", "o", "b", "a", "r"]
        let result = ["0 - f", "1 - o", "2 - o", "3 - b", "4 - a", "5 - r"]
        
        XCTAssertEqual(R.addIndex(f, list), result)
        
        XCTAssertEqual(R.curry(R.addIndex)(f)(list), result)
        
        XCTAssertEqual(R.addIndex(R.__, list)(f), result)
        XCTAssertEqual(R.addIndex(f, R.__)(list), result)
    }
    
    func testAdjust() {
        let input1 = 1
        let f: (String) -> String = { $0.uppercased() }
        let input3 = ["a", "b", "c", "d"]
        let output = ["a", "B", "c", "d"]
        
        XCTAssertEqual(R.adjust(input1, f, input3) as! [String], output)
        
        XCTAssertEqual(R.curry(R.adjust)(input1)(f)(input3) as! [String], output)
        
        XCTAssertEqual(R.adjust(R.__, f, input3)(input1) as! [String], output)
        XCTAssertEqual(R.adjust(input1, R.__, input3)(f) as! [String], output)
        XCTAssertEqual(R.adjust(input1, f, R.__)(input3) as! [String], output)
    }
    
    func testAll() {
        let f: (Int) -> Bool = { $0 == 3 }
        let input2 = [3, 3, 1, 3]
        
        XCTAssertFalse(R.all(f, input2))
        XCTAssertFalse(R.curry(R.all)(f)(input2))
        
        XCTAssertFalse(R.all(R.__, input2)(f))
        XCTAssertFalse(R.all(f, R.__)(input2))
        
        //
        XCTAssertTrue(R.all(f, [3, 3, 3, 3]))
        
        XCTAssertTrue(R.curry(R.all)(f)([3, 3, 3, 3]))
        
        XCTAssertTrue(R.all(R.__, [3, 3, 3, 3])(f))
        XCTAssertTrue(R.all(f, R.__)([3, 3, 3, 3]))
    }
    
    func testAllPass() {
        let f1: (String) -> Bool = { $0.count == 1 }
        let f2: (String) -> Bool = { Int($0) != nil }
        let f3: (String) -> Bool = { $0.count == 2 }
        
        let input = "1"
        
        XCTAssertTrue(R.allPass([f1, f2])(input))
        XCTAssertTrue(R.curry(R.allPass)([f1, f2])(input))
        
        XCTAssertFalse(R.allPass([f1, f2, f3])(input))
        XCTAssertFalse(R.curry(R.allPass)([f1, f2, f3])(input))
    }
    
    func testAlways() {
        XCTAssertEqual(R.always(1)(), 1)
        XCTAssertEqual(R.always(1)(100), 1)
        
        XCTAssertEqual(R.always("a")(), "a")
        XCTAssertEqual(R.always("a")("b"), "a")
    }
    
    func testAnd() {
        XCTAssertTrue(R.and(true, true))
        XCTAssertTrue(R.and(R.__, true)(true))
        XCTAssertTrue(R.and(true, R.__)(true))
        
        XCTAssertFalse(R.and(true, false))
        XCTAssertFalse(R.and(R.__, false)(true))
        XCTAssertFalse(R.and(true, R.__)(false))
        
        XCTAssertFalse(R.and(false, true))
        XCTAssertFalse(R.and(R.__, true)(false))
        XCTAssertFalse(R.and(false, R.__)(true))
        
        XCTAssertFalse(R.and(false, false))
        XCTAssertFalse(R.and(R.__, false)(false))
        XCTAssertFalse(R.and(false, R.__)(false))
    }
    
    //andThen
    
    func testAny() {
        let f: (Int) -> Bool = { $0 == 3 }
        let input2 = [1, 1, 1, 3]
        
        XCTAssertTrue(R.any(f, input2))
        XCTAssertTrue(R.curry(R.any)(f)(input2))
        XCTAssertTrue(R.any(R.__, input2)(f))
        XCTAssertTrue(R.any(f, R.__)(input2))
    }
    
    func testAnyPass() {
        let f1: (String) -> Bool = { $0.count == 2 }
        let f2: (String) -> Bool = { Int($0) != nil }
        
        let input = "1"
        
        XCTAssertTrue(R.anyPass([f1, f2])(input))
    }
    
    func testAp() {
        let input = ["pizza", "salad"]
        let f1: (String) -> String = { $0.uppercased() }
        let f2: (String) -> String = { $0 + " A" }
        let output = ["PIZZA", "SALAD", "pizza A", "salad A"]
        
        XCTAssertEqual(R.ap([f1, f2], input), output)

        XCTAssertEqual(R.curry(R.ap)([f1, f2])(input), output)
        
        XCTAssertEqual(R.ap(R.__, input)([f1, f2]), output)
        XCTAssertEqual(R.ap([f1, f2], R.__)(input), output)
    }
    
    func testAperture() {
        let input = [1, 2, 3]
        
        XCTAssertEqual(R.aperture(1, input), [[1], [2], [3]])
        XCTAssertEqual(R.aperture(2, input), [[1, 2], [2, 3]])
        XCTAssertEqual(R.aperture(3, input), [[1, 2, 3]])
        XCTAssertEqual(R.aperture(0, input), [[], [], []])
        XCTAssertEqual(R.aperture(4, input), [])
        
        XCTAssertEqual(R.aperture(R.__, input)(1), [[1], [2], [3]])
        XCTAssertEqual(R.aperture(2, R.__)(input), [[1, 2], [2, 3]])
        XCTAssertEqual(R.curry(R.aperture)(3)(input), [[1, 2, 3]])
    }
    
    func testAppend() {
        let input = ["write", "more"]
        let output = ["write", "more", "tests"]
        
        XCTAssertEqual(R.append("tests", input), output)
        
        XCTAssertEqual(R.curry(R.append)("tests")(input), output)
        XCTAssertEqual(R.append(R.__, input)("tests"), output)
        XCTAssertEqual(R.append("tests", R.__)(input), output)
    }
    
    func testApply() {
        let f: (String) -> String = { $0.uppercased() }
        let input = "pizza"
        let output = "PIZZA"
        
        XCTAssertEqual(R.apply(f, input), output)
        
        XCTAssertEqual(R.curry(R.apply)(f)(input), output)
        XCTAssertEqual(R.apply(R.__, input)(f), output)
        XCTAssertEqual(R.apply(f, R.__)(input), output)
    }
    
    //applySpec
    
    func testApplyTo() {
        let f: (String) -> String = { $0.uppercased() }
        let input = "pizza"
        let output = "PIZZA"
        
        XCTAssertEqual(R.applyTo(input, f), output)
        XCTAssertEqual(R.curry(R.applyTo)(input)(f), output)
        
        XCTAssertEqual(R.curry(R.applyTo)(input)(f), output)
        XCTAssertEqual(R.applyTo(R.__, f)(input), output)
        XCTAssertEqual(R.applyTo(input, R.__)(f), output)
    }
    
    func testAscend() {
        struct User: Equatable {
            let age: Int
        }
        
        let f: (User) -> Int = { $0.age }
        
        let input = [User(age: 2), User(age: 1)]
        let output = [User(age: 1), User(age: 2)]
        
        XCTAssertEqual(input.sorted(by: R.ascend(f)), output)
    }
    
    func testDescend() {
        struct User: Equatable {
            let age: Int
        }
        
        let f: (User) -> Int = { $0.age }
        
        let input = [User(age: 1), User(age: 2)]
        let output = [User(age: 2), User(age: 1)]
        
        XCTAssertEqual(input.sorted(by: R.descend(f)), output)
    }
    
    func testAssocPath() {
        
        XCTAssertEqual(R.assocPath(["a"], 1, ["a": 0]) as! [String: Int],
                       ["a": 1])

        XCTAssertEqual(R.assocPath(["a"], 1, ["a": ["b": 2]]) as! [String: Int],
                       ["a": 1])

        XCTAssertEqual(R.assocPath(["a", "b"], 1, ["a": ["b": 2]]) as! [String: [String: Int]],
                       ["a": ["b": 1]])

        XCTAssertEqual(R.assocPath(["a", "b"], 1, ["a": ["c": 2]]) as! [String: [String: Int]],
                       ["a": ["c": 2, "b": 1]])
        
//        print(R.assocPath(["a", "b", "c"], 1, ["a": ["d": 2]]))
//        print(R.assocPath(["a", "b", "c"], 1, ["a": 2]))
    }
}
