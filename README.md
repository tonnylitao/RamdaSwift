# [Ramda.JS](https://ramdajs.com) in Swift

[![Version](https://img.shields.io/cocoapods/v/Ramda.svg?style=flat)](https://cocoapods.org/pods/Ramda)
[![License](https://img.shields.io/cocoapods/l/Ramda.svg?style=flat)](https://cocoapods.org/pods/Ramda)
[![Platform](https://img.shields.io/cocoapods/p/Ramda.svg?style=flat)](https://cocoapods.org/pods/Ramda)

### Installation
```ruby
pod 'Ramda'
```


## API
More details in [Doc](https://ramdajs.com/docs)
### __

```swift
R.add(R.__, 2)(1) //3
R.add(1, R.__)(2) //3
```

### add

```swift
R.add(2, 3) // 5
```

### addIndex

```swift
let f: (Int, String) -> String = { "\($0) - \($1)" }

R.addIndex(f, ["f", "o", "o", "b", "a", "r"])

//["0 - f", "1 - o", "2 - o", "3 - b", "4 - a", "5 - r"]
```

### adjust

```swift
let f: (String) -> String = { $0.uppercased() }

R.adjust(1, f, ["a", "b", "c", "d"]) //["a", "B", "c", "d"]
```

### all

```swift
let f: (Int) -> Bool = { $0 == 3 }

R.all(f, [3, 3, 3, 3]) //true
```

### allPass

```swift
let f1: (String) -> Bool = { $0.count == 1 }
let f2: (String) -> Bool = { Int($0) != nil }

R.allPass([f1, f2])("2") //true
```

### always

```swift
R.always(1)() //1
R.always(1)("2") //1
```

### and

```swift
R.and(false, true) //false
```

### any

```swift
let f: (Int) -> Bool = { $0 == 3 }

R.any(f, [1, 1, 1, 3]) //true
```

### anyPass

```swift
let f1: (String) -> Bool = { $0.count == 2 }
let f2: (String) -> Bool = { Int($0) != nil }

R.allPass([f1, f2])("2") //true
```

### ap

```swift
let f1: (String) -> String = { $0.uppercased() }
let f2: (String) -> String = { $0 + " A" }

R.ap([f1, f2], ["pizza", "salad"]) //["PIZZA", "SALAD", "pizza A", "salad A"]
```

### aperture

```swift
R.aperture(0, [1, 2, 3]), [[], [], []])
R.aperture(1, [1, 2, 3]), [[1], [2], [3]])
R.aperture(2, [1, 2, 3]), [[1, 2], [2, 3]])
R.aperture(3, [1, 2, 3]), [[1, 2, 3]])
R.aperture(4, [1, 2, 3]), [])
```

### append

```swift
R.append("tests, ["write", "more"]) //["write", "more", "tests"]
```

### apply

```swift
let f: (String) -> String = { $0.uppercased() }
R.apply(f, "pizza") //"PIZZA"
```

### applyTo

```swift
let f: (String) -> String = { $0.uppercased() }
R.applyTo("pizza", f) //"PIZZA"

R.flip(R.apply)("pizza", f) //"PIZZA"
```

### ascend

```swift
let f: (User) -> Int = { $0.age }

[User(age: 2), User(age: 1)].sorted(by: R.ascend(f)) //[User(age: 1), User(age: 2)]
```

### descend

```swift
let f: (User) -> Int = { $0.age }

[User(age: 1), User(age: 2)].sorted(by: R.descend(f)) //[User(age: 2), User(age: 1)]
```

### assocPath

```swift
R.assocPath(["a"], 1, ["a": 0]) //["a": 1]

R.assocPath(["a", "b"], 1, ["a": ["b": 2]]) //["a": ["b": 1]]

R.assocPath(["a", "b"], 1, ["a": ["c": 2]]) //["a": ["b": 1, "c": 2]]
               
R.assocPath(["a", "b", "c"], 1, ["a": ["d": 2]]) //["a": ["d": 2, "b": ["c": 1]]]
```

