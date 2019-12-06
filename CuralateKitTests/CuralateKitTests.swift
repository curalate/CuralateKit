//
// Copyright (c) 2011-2019 by Curalate, Inc.
//

import XCTest
import OHHTTPStubs
@testable import CuralateKit


class CuralateKitTests: XCTestCase {

    override func setUp() {
        stub(condition: isHost("api-2.curalate.com") && isPath("/v1/media/01")) { _ in
            return OHHTTPStubsResponse(
              fileAtPath: OHPathForFile("getMedia01.json", type(of: self))!,
              statusCode: 200,
              headers: ["Content-Type":"application/json"]
            )
        }
    }

    override func tearDown() {
        OHHTTPStubs.removeAllStubs()
    }

    // Happy path test. Two media items: one image and one video.
    func test01() throws {

        let curalate = Curalate(dataSourceId: "01")
        let expectation = self.expectation(description: "calls the callback with a response object")

        curalate.getMedia(limit: 2) { (response, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(response)
            XCTAssertEqual(response?.data.items.count, 2)

            let item1 = response?.data.items[0];
            XCTAssertEqual(item1?.id, "xxxxxxxx-1da2-460a-b130-0be31760dd54")
            XCTAssertEqual(item1?.source.type, ItemType.instagram)
            XCTAssertEqual(item1?.source.postedTimestamp, 1575039829)
            XCTAssertNotNil(item1?.source.user)
            XCTAssertEqual(item1?.source.user?.username, "username1")
            XCTAssertEqual(item1?.source.user?.displayName, "User 1")
            XCTAssertEqual(item1?.source.user?.link, URL(string:"https://instagram.com/username1"))
            XCTAssertNotNil(item1?.source.user?.image)
            self.verifyThumbnail(photo:item1!.source.user!.image!, fileId:"XXXbVoTfggbzxJ419hT8r8w7rwplVNmPFF4goUXWDB8=")
            XCTAssertEqual(item1?.source.user?.followerCount, 7982685)
            XCTAssertEqual(item1?.source.user?.followingCount, 420)
            XCTAssertEqual(item1?.source.link, URL(string:"https://www.instagram.com/p/XXXCTfKAQih/"))
            XCTAssertEqual(item1?.source.caption, "Caption 1")
            XCTAssertEqual(item1?.source.commentCount, 180)
            XCTAssertEqual(item1?.source.likeCount, 39612)
            XCTAssertEqual(item1?.source.sourceId, "XXX7915129188845729_5858873")
            XCTAssertNil(item1?.source.repinCount)
            XCTAssertNil(item1?.source.location)
            XCTAssert(item1?.labels.count == 3)
            XCTAssertEqual(item1?.labels[0], "label1")
            XCTAssertEqual(item1?.labels[1], "label2")
            XCTAssertEqual(item1?.labels[2], "label3")
            switch item1?.media {
            case .networkPhoto(let networkPhoto):
                self.verifyPhoto(photo:networkPhoto, fileId:"XXX7lkBKgmZouVGx_DJECNL7eCEGcT1c5EMp0m5DufQ=")
            default:
                XCTFail("Media is not a NetworkPhoto")
            }
            XCTAssertEqual(item1?.products.count, 1)
            let product1 = item1?.products[0]
            XCTAssertEqual(product1?.id, "s_2131_bfcc093c269024bcf73e7e17e5220c96363291c6737e3d2fbcc1e2d6f757dec1")
            XCTAssertEqual(product1?.name, "Product 1")
            XCTAssertEqual(product1?.images.count, 1)
            self.verifyPhoto(photo:product1!.images[0], fileId:"XXXkiitf7ArW63a0NKKJxPsl5vZ8-3AJPb9uXfQlFTE=")
            XCTAssertEqual(product1?.price?.display, "140")
            XCTAssertEqual(product1?.price?.value, 140)
            XCTAssertEqual(product1?.price?.currencySymbol, "$")
            XCTAssertEqual(product1?.price?.currencyCode, "USD")
            XCTAssertEqual(product1?.link, URL(string:"https://www.example.com/product1"))
            XCTAssertEqual(product1?.metadata, [
                "manufacturer": "Manufacturer1",
                "isAvailable": "true",
                "curalateProductId": "p_2131_10208d11216f6beb28e9c49da6355424ea660b1512ff725c98ac6a9d6fe9a558",
                "productId": "01"
            ]);
            XCTAssertEqual(product1?.spatialTag?.x, 0.5704057216644287);
            XCTAssertEqual(product1?.spatialTag?.y, 0.5226730108261108);
            XCTAssertEqual(product1?.spatialTag?.label, "1");

            let item2 = response?.data.items[1];
            switch item2?.media {
            case .networkVideo(let networkVideo):
                self.verifyVideo(video:networkVideo, videoId:"XXXfa46a-7e7d-4f0c-aa49-1b9d8a9794ac", posterFileId:"XXXL1ifLWa95ZuSyhSLEwS_mmPAFLwqsBvm6-Xz1HdU=")
            default:
                XCTFail("Media is not a NetworkVideo")
            }

            let metadata = response?.metadata
            XCTAssertNotNil(metadata)
            XCTAssertNotNil(metadata?.traceId)
            XCTAssertNotNil(metadata?.requestId)
            XCTAssertNotNil(metadata?.curalateUserId)
            XCTAssertNil(metadata?.firstPartyCuid)
            XCTAssertNil(metadata?.customCuralateUserId)

            expectation.fulfill()
        }

        self.waitForExpectations(timeout: 0.5, handler: .none)
    }

    //
    //
    //

    private func verifyThumbnail(photo: ThumbnailPhoto, fileId: String) {
        XCTAssertEqual(photo.original.link, URL(string:"https://d28m5bx785ox17.cloudfront.net/v1/img/\(fileId)"))
        XCTAssertEqual(photo.small.link, URL(string:"https://d28m5bx785ox17.cloudfront.net/v1/img/\(fileId)/w/150"))
        XCTAssertEqual(photo.medium.link, URL(string:"https://d28m5bx785ox17.cloudfront.net/v1/img/\(fileId)/w/300"))
        XCTAssertEqual(photo.smallSquare.link, URL(string:"https://d28m5bx785ox17.cloudfront.net/v1/img/\(fileId)/sc/150x150"))
        XCTAssertEqual(photo.mediumSquare.link, URL(string:"https://d28m5bx785ox17.cloudfront.net/v1/img/\(fileId)/sc/300x300"))
    }
    
    private func verifyPhoto(photo: NetworkPhoto, fileId: String) {
        XCTAssertEqual(photo.original.link, URL(string:"https://d28m5bx785ox17.cloudfront.net/v1/img/\(fileId)"))
        XCTAssertEqual(photo.small.link, URL(string:"https://d28m5bx785ox17.cloudfront.net/v1/img/\(fileId)/w/150"))
        XCTAssertEqual(photo.medium.link, URL(string:"https://d28m5bx785ox17.cloudfront.net/v1/img/\(fileId)/w/300"))
        XCTAssertEqual(photo.large.link, URL(string:"https://d28m5bx785ox17.cloudfront.net/v1/img/\(fileId)/w/600"))
        // Use starts with due to potential presence of spatial tags
        XCTAssert(photo.extraLarge.link.absoluteString.starts(with: "https://d28m5bx785ox17.cloudfront.net/v1/img/\(fileId)/w/1080"))
        XCTAssert(photo.smallSquare.link.absoluteString.starts(with:"https://d28m5bx785ox17.cloudfront.net/v1/img/\(fileId)/sc/150x150"))
        XCTAssert(photo.mediumSquare.link.absoluteString.starts(with:"https://d28m5bx785ox17.cloudfront.net/v1/img/\(fileId)/sc/300x300"))
        XCTAssert(photo.largeSquare.link.absoluteString.starts(with:"https://d28m5bx785ox17.cloudfront.net/v1/img/\(fileId)/sc/600x600"))
        XCTAssert(photo.extraLargeSquare.link.absoluteString.starts(with:"https://d28m5bx785ox17.cloudfront.net/v1/img/\(fileId)/sc/1080x1080"))
    }
    
    private func verifyVideo(video: NetworkVideo, videoId: String, posterFileId: String) {
        XCTAssertEqual(video.original.link, URL(string:"https://d28m5bx785ox17.cloudfront.net/v1/vid/\(videoId)/h"))
        XCTAssertEqual(video.highQuality.link, URL(string:"https://d28m5bx785ox17.cloudfront.net/v1/vid/\(videoId)/h"))
        XCTAssertEqual(video.lowQuality.link, URL(string:"https://d28m5bx785ox17.cloudfront.net/v1/vid/\(videoId)/l"))
        verifyPhoto(photo:video.poster!, fileId:posterFileId)
    }
}
