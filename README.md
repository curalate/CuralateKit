# CuralateKit

CuralateKit is an API client to call Curalate's API methods with Swift.

For questions or support, please contact your Curalate Account Manager or support@curalate.com.

## Installation

### Swift Package Manager

```
.package(url: "https://github.com/curalate/CuralateKit.git", from: "0.2.0"),
```

### Carthage

```
github "curalate/CuralateKit" ~> 0.2.0
```

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
    } else if let response = response {
        DispatchQueue.main.async {
            response.data.items.forEach { item in
                switch item.media {
                case .networkPhoto(let networkPhoto):
                    // Process photo
                    break;
                case .networkVideo(let networkVideo):
                    // Process video
                    break;
                case .networkGif(let networkGif):
                    // Process GIF
                    break;
                }
            }
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

### Recording Events

```swift
// Note that events are queued for batch processing
curalate.recordEvent(type: .itemClick, itemId: itemId, position: itemIndex)
```
