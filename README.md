# [Ramda.JS](https://ramdajs.com) in Swift

[![CI Status](https://img.shields.io/travis/tonnylitao/Ramda.svg?style=flat)](https://travis-ci.org/tonnylitao/Ramda)
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
R.add(R.__, 10)(7) // 17
R.add(7, R.__)(10) // 17
```

### addIndex

```swift
let f: (Int, String) -> String = { "\($0) - \($1)" }

R.addIndex(f, ["f", "o", "o", "b", "a", "r"])
R.addIndex(R.__, ["f", "o", "o", "b", "a", "r"])(f)
R.addIndex(f, R.__)(["f", "o", "o", "b", "a", "r"])

//["0 - f", "1 - o", "2 - o", "3 - b", "4 - a", "5 - r"]
```

### adjust

```swift
let f: (String) -> String = { $0.uppercased() }

R.adjust(1, f, ["a", "b", "c", "d"]) //["a", "B", "c", "d"]
```
