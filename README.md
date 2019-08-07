# CuralateKit

CuralateKit is an API client to call Curalate's API methods with Swift.

For questions or support, please contact your Curalate Account Manager or support@curalate.com.

## Installation

### CocoaPods

Instructions for installation via CocoaPods is coming soon.

### Carthage [COMING SOON]

Instructions for installation via Carthage is coming soon.

## Usage

### Creating the API Client

```swift
import CuralateKit

let curalate = Curalate(dataSourceId: "<YOUR_DATA_SOURCE_ID>")
```

### Fetch content (no filters)

```swift
curalate.getMedia(limit: limit) { (response, error) in
    if let error: Error = error {
        print("Error from Curalate API. \(error)")
    } else if let response = response, let data = response.data {
        DispatchQueue.main.async {
            // process data.items
        }
    }
}
```

### Fetch content (using filters)

```swift
let filter = MediaFilter(key: .productID, value: "SKU12345")
  .and(MediaFilter(key: .label, value: "streetstyle"))
curalate.getMedia(limit: limit, filter: filter) { (response, error) ... }
```

### Paginate through content

```swift
// self.cursors set from previous call. cursors = response.paging.cursors.
curalate.getMedia(limit: limit, after: self.cursors.after) { (response, error) .. }
```
