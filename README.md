![Cocoapods platforms](https://img.shields.io/cocoapods/p/PerformanceSuite)
[![CocoaPod Version](https://img.shields.io/cocoapods/v/KIF.svg?style=flat)](https://cocoapods.org)
<img src="https://img.shields.io/badge/swift5-compatible-green.svg?style=flat" alt="Swift 5 compatible" />

# NetworkSessionKit

## Installation
---
### Cocoapods

NetworkSessionKit is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:


e.g.:
```ruby
pod 'NetworkSessionKit', '1.0.0'
```

### Swift Package Manager

1. File > Swift Packages > Add Package Dependency
2. Add `https://github.com/jadernunes/NetworkSessionKit.git`

_OR_

Update `dependencies` in `Package.swift`
```swift
dependencies: [
    .package(url: "https://github.com/jadernunes/NetworkSessionKit.git", .upToNextMajor(from: "1.0.0"))
]
```

## Usage
---

Basically you'll have to use `Requestable` protocol and that's it, but below is an example of how to get the better of it:

1. Create your a file where you'll place the implementation of this protocol. i.e.: Resource.

```swift
import NetworkSession

enum ListAnimalsResources {
    case loadAll
}

extension ListAnimalsResources: Requestable {
    
    var method: HTTPMethodType {
        switch self {
        case .loadAll:
            return .get
        }
    }
    
    var parameters: Params? {
        switch self {
        case let .loadAll:
            let params: [String: Any] = [
                "blabla": "bla"
            ]
            
            return params
        }
    }
    
    var path: String {
        switch self {
        case .loadAll:
            return "/animals"
        }
    }
}
```

2. Create a file where you'll implement the request.
```swift
import Foundation
import NetworkSession

protocol IListAnimalsService {
    func loadAll() async throws -> [AnimalDTO]
}

struct ListAnimalsService: IListAnimalsService {
    
    // MARK: - Properties
    
    private let network: INetwork
    
    // MARK: - Life cycle
    
    init(network: INetwork = NetworkInstance) {
        self.network = network
    }
    
    // MARK: - Methods
    
    func loadAll() async throws -> [AnimalDTO] {
        try await network
            .makeRequest(requester: ListAnimalsResources.loadAll)
    }
}
```

3. The next step is to call the actual request
```swift
protocol IListAnimalsViewModel {
    func loadAllAnimals() async
}

struct ListAnimalsViewModel: IListAnimalsViewModel {
    
    // MARK: - Properties
    
    private let service: IListAnimalsService
    
    // MARK: - Life cycle
    
    init(service: IListAnimalsService = ListAnimalsService()) {
        self.service = service
    }
    
    // MARK: - Methods
    
    @MainActor
    func loadAllAnimals() async {
        do {
            let animals = try await service.loadAll(page: page)
        } catch {
            // Handle error
        }
    }
}
```
