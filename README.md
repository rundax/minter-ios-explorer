# MinterExplorer

[![CI Status](https://img.shields.io/travis/sidorov.panda/MinterExplorer.svg?style=flat)](https://travis-ci.org/sidorov.panda/MinterExplorer)
[![Version](https://img.shields.io/cocoapods/v/MinterExplorer.svg?style=flat)](https://cocoapods.org/pods/MinterExplorer)
[![License](https://img.shields.io/cocoapods/l/MinterExplorer.svg?style=flat)](https://cocoapods.org/pods/MinterExplorer)
[![Platform](https://img.shields.io/cocoapods/p/MinterExplorer.svg?style=flat)](https://cocoapods.org/pods/MinterExplorer)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

MinterExplorer is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'MinterExplorer'
```

## How-to
```swift
import MinterCore
import MinterExplorer
```

**Get Transactions**
```swift
let http = APIClient.shared
let transactionManager = MinterExplorer.TransactionManager(httpClient: http)

let addresses = ["Mx228e5a68b847d169da439ec15f727f08233a7ca6"]
/// Transactions list for
transactionManager?.transactions(addresses: addresses, completion: { (transactions, error) in
  print(transactions)
  print(error)
})
/// Single transaction
transactionManager?.transaction(hash: "Mtecc04e7ca110a69b46af6fb0afc8c89ea459e6a1", completion: { (transaction, error) in
  print(transaction)
  print(error)

})
```

**Get Addresses**
```swift
let addresses = ["Mx228e5a68b847d169da439ec15f727f08233a7ca6"]

/// Addresses list
addressesManager = AddressManager(httpClient: http)
addressesManager?.addresses(addresses: addresses, completion: { (addresses, error) in
  print(addresses)
  print(error)
})

/// Web-socket channel to get live balance changes
addressesManager?.balanceChannel(addresses: addresses, completion: { (chanel, token, timestamp, error) in
  print(chanel)
  print(token)
  print(timestamp)
  print(error)
})
```
**Get Network Status**
```swift
infoManager = InfoManager(httpClient: http)

/// BIP Status Info
infoManager?.status(with: { (status, error) in
  print(status)
  print(error)
})
/// Status Page Info
infoManager?.statusPage(with: { (status, error) in
  print(status)
  print(error)
})
/// Transaction Count Chart Info
infoManager?.txCountChartData(with: { (data, error) in
  print(data)
  print(error)
})
```
**Get Block Info**
```swift
blockManager = BlockManager(httpClient: http)
/// Get block info by height
blockManager?.block(height: 1, completion: { (block, error) in
  print(block)
  print(error)
})
/// Get blocks with paging
blockManager?.blocks(page: 1, completion: { (blocks, error) in
  print(blocks)
  print(error)
})
```

## Author

sidorov.panda, ody344@gmail.com

## License

MinterExplorer is available under the MIT license. See the LICENSE file for more info.
