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
R.add(R.__, 2)(1)
R.add(R.__)(1)(2)

// 1 + 2
```

### add

```swift
R.add(2, 3) // 5
R.add(7)(10) // 17
```

### addIndex

```swift
let f: (Int, String) -> String = { "\($0) - \($1)" }

R.addIndex(f, ["f", "o", "o", "b", "a", "r"])
R.addIndex(f)(["f", "o", "o", "b", "a", "r"])

//["0 - f", "1 - o", "2 - o", "3 - b", "4 - a", "5 - r"]
```

