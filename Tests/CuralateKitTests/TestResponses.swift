//
// Copyright (c) 2011-2020 by Curalate, Inc.
//

struct TestResponses {
    
    static let getMedia01 =
"""
{
    "data": {
        "items": [
            {
                "id": "xxxxxxxx-1da2-460a-b130-0be31760dd54",
                "source": {
                    "type": "instagram",
                    "postedTimestamp": 1575039829,
                    "user": {
                        "username": "username1",
                        "displayName": "User 1",
                        "link": "https://instagram.com/username1",
                        "image": {
                            "original": {
                                "link": "https://d28m5bx785ox17.cloudfront.net/v1/img/XXXbVoTfggbzxJ419hT8r8w7rwplVNmPFF4goUXWDB8="
                            },
                            "small": {
                                "link": "https://d28m5bx785ox17.cloudfront.net/v1/img/XXXbVoTfggbzxJ419hT8r8w7rwplVNmPFF4goUXWDB8=/w/150"
                            },
                            "medium": {
                                "link": "https://d28m5bx785ox17.cloudfront.net/v1/img/XXXbVoTfggbzxJ419hT8r8w7rwplVNmPFF4goUXWDB8=/w/300"
                            },
                            "smallSquare": {
                                "link": "https://d28m5bx785ox17.cloudfront.net/v1/img/XXXbVoTfggbzxJ419hT8r8w7rwplVNmPFF4goUXWDB8=/sc/150x150"
                            },
                            "mediumSquare": {
                                "link": "https://d28m5bx785ox17.cloudfront.net/v1/img/XXXbVoTfggbzxJ419hT8r8w7rwplVNmPFF4goUXWDB8=/sc/300x300"
                            }
                        },
                        "followerCount": 7982685,
                        "followingCount": 420
                    },
                    "link": "https://www.instagram.com/p/XXXCTfKAQih/",
                    "caption": "Caption 1",
                    "commentCount": 180,
                    "likeCount": 39612,
                    "sourceId": "XXX7915129188845729_5858873"
                },
                "media": {
                    "id": "XXX7lkBKgmZouVGx_DJECNL7eCEGcT1c5EMp0m5DufQ=",
                    "original": {
                        "link": "https://d28m5bx785ox17.cloudfront.net/v1/img/XXX7lkBKgmZouVGx_DJECNL7eCEGcT1c5EMp0m5DufQ="
                    },
                    "small": {
                        "link": "https://d28m5bx785ox17.cloudfront.net/v1/img/XXX7lkBKgmZouVGx_DJECNL7eCEGcT1c5EMp0m5DufQ=/w/150"
                    },
                    "medium": {
                        "link": "https://d28m5bx785ox17.cloudfront.net/v1/img/XXX7lkBKgmZouVGx_DJECNL7eCEGcT1c5EMp0m5DufQ=/w/300"
                    },
                    "large": {
                        "link": "https://d28m5bx785ox17.cloudfront.net/v1/img/XXX7lkBKgmZouVGx_DJECNL7eCEGcT1c5EMp0m5DufQ=/w/600"
                    },
                    "extraLarge": {
                        "link": "https://d28m5bx785ox17.cloudfront.net/v1/img/XXX7lkBKgmZouVGx_DJECNL7eCEGcT1c5EMp0m5DufQ=/w/1080"
                    },
                    "smallSquare": {
                        "link": "https://d28m5bx785ox17.cloudfront.net/v1/img/XXX7lkBKgmZouVGx_DJECNL7eCEGcT1c5EMp0m5DufQ=/sc/150x150?spatialTags=0.570406:0.522673"
                    },
                    "mediumSquare": {
                        "link": "https://d28m5bx785ox17.cloudfront.net/v1/img/XXX7lkBKgmZouVGx_DJECNL7eCEGcT1c5EMp0m5DufQ=/sc/300x300?spatialTags=0.570406:0.522673"
                    },
                    "largeSquare": {
                        "link": "https://d28m5bx785ox17.cloudfront.net/v1/img/XXX7lkBKgmZouVGx_DJECNL7eCEGcT1c5EMp0m5DufQ=/sc/600x600?spatialTags=0.570406:0.522673"
                    },
                    "extraLargeSquare": {
                        "link": "https://d28m5bx785ox17.cloudfront.net/v1/img/XXX7lkBKgmZouVGx_DJECNL7eCEGcT1c5EMp0m5DufQ=/sc/1080x1080?spatialTags=0.570406:0.522673"
                    },
                    "type": "photo"
                },
                "products": [
                    {
                        "id": "s_2131_bfcc093c269024bcf73e7e17e5220c96363291c6737e3d2fbcc1e2d6f757dec1",
                        "name": "Product 1",
                        "images": [
                            {
                                "id": "XXXkiitf7ArW63a0NKKJxPsl5vZ8-3AJPb9uXfQlFTE=",
                                "original": {
                                    "link": "https://d28m5bx785ox17.cloudfront.net/v1/img/XXXkiitf7ArW63a0NKKJxPsl5vZ8-3AJPb9uXfQlFTE="
                                },
                                "small": {
                                    "link": "https://d28m5bx785ox17.cloudfront.net/v1/img/XXXkiitf7ArW63a0NKKJxPsl5vZ8-3AJPb9uXfQlFTE=/w/150"
                                },
                                "medium": {
                                    "link": "https://d28m5bx785ox17.cloudfront.net/v1/img/XXXkiitf7ArW63a0NKKJxPsl5vZ8-3AJPb9uXfQlFTE=/w/300"
                                },
                                "large": {
                                    "link": "https://d28m5bx785ox17.cloudfront.net/v1/img/XXXkiitf7ArW63a0NKKJxPsl5vZ8-3AJPb9uXfQlFTE=/w/600"
                                },
                                "extraLarge": {
                                    "link": "https://d28m5bx785ox17.cloudfront.net/v1/img/XXXkiitf7ArW63a0NKKJxPsl5vZ8-3AJPb9uXfQlFTE=/w/1080"
                                },
                                "smallSquare": {
                                    "link": "https://d28m5bx785ox17.cloudfront.net/v1/img/XXXkiitf7ArW63a0NKKJxPsl5vZ8-3AJPb9uXfQlFTE=/sc/150x150"
                                },
                                "mediumSquare": {
                                    "link": "https://d28m5bx785ox17.cloudfront.net/v1/img/XXXkiitf7ArW63a0NKKJxPsl5vZ8-3AJPb9uXfQlFTE=/sc/300x300"
                                },
                                "largeSquare": {
                                    "link": "https://d28m5bx785ox17.cloudfront.net/v1/img/XXXkiitf7ArW63a0NKKJxPsl5vZ8-3AJPb9uXfQlFTE=/sc/600x600"
                                },
                                "extraLargeSquare": {
                                    "link": "https://d28m5bx785ox17.cloudfront.net/v1/img/XXXkiitf7ArW63a0NKKJxPsl5vZ8-3AJPb9uXfQlFTE=/sc/1080x1080"
                                },
                                "type": "photo"
                            }
                        ],
                        "price": {
                            "display": "140",
                            "value": 140,
                            "currencySymbol": "$",
                            "currencyCode": "USD"
                        },
                        "link": "https://www.example.com/product1",
                        "metadata": {
                            "manufacturer": "Manufacturer1",
                            "isAvailable": "true",
                            "curalateProductId": "p_2131_10208d11216f6beb28e9c49da6355424ea660b1512ff725c98ac6a9d6fe9a558",
                            "productId": "01"
                        },
                        "spatialTag": {
                            "x": 0.5704057216644287,
                            "y": 0.5226730108261108,
                            "label": "1"
                        }
                    }
                ],
                "labels": [
                    "label1",
                    "label2",
                    "label3"
                ]
            },
            {
                "id": "xxxxxxxx-b3d9-4627-be54-c23534949d52",
                "source": {
                    "type": "instagram",
                    "postedTimestamp": 1570130043,
                    "user": {
                        "username": "username2",
                        "displayName": "User 2",
                        "link": "https://instagram.com/username2",
                        "image": {
                            "original": {
                                "link": "https://d28m5bx785ox17.cloudfront.net/v1/img/XXX-Xj9mCUX2qHScpDUP1R1r_MIe1sftUt_OM_NStgY="
                            },
                            "small": {
                                "link": "https://d28m5bx785ox17.cloudfront.net/v1/img/XXX-Xj9mCUX2qHScpDUP1R1r_MIe1sftUt_OM_NStgY=/w/150"
                            },
                            "medium": {
                                "link": "https://d28m5bx785ox17.cloudfront.net/v1/img/XXX-Xj9mCUX2qHScpDUP1R1r_MIe1sftUt_OM_NStgY=/w/300"
                            },
                            "smallSquare": {
                                "link": "https://d28m5bx785ox17.cloudfront.net/v1/img/XXX-Xj9mCUX2qHScpDUP1R1r_MIe1sftUt_OM_NStgY=/sc/150x150"
                            },
                            "mediumSquare": {
                                "link": "https://d28m5bx785ox17.cloudfront.net/v1/img/XXX-Xj9mCUX2qHScpDUP1R1r_MIe1sftUt_OM_NStgY=/sc/300x300"
                            }
                        },
                        "followerCount": 295012,
                        "followingCount": 365
                    },
                    "link": "https://www.instagram.com/p/XXXtmX7gYf3/",
                    "caption": "The #UAHOVR Infinite, our most popular distance shoe, syncs with @uamapmyrun to track your pace, stride length, cadence and more. New colors available now.",
                    "commentCount": 7,
                    "likeCount": 1081,
                    "sourceId": "17847815668646246"
                },
                "media": {
                    "original": {
                        "link": "https://d28m5bx785ox17.cloudfront.net/v1/vid/XXXfa46a-7e7d-4f0c-aa49-1b9d8a9794ac/h"
                    },
                    "highQuality": {
                        "link": "https://d28m5bx785ox17.cloudfront.net/v1/vid/XXXfa46a-7e7d-4f0c-aa49-1b9d8a9794ac/h"
                    },
                    "lowQuality": {
                        "link": "https://d28m5bx785ox17.cloudfront.net/v1/vid/XXXfa46a-7e7d-4f0c-aa49-1b9d8a9794ac/l"
                    },
                    "poster": {
                        "id": "XXXL1ifLWa95ZuSyhSLEwS_mmPAFLwqsBvm6-Xz1HdU=",
                        "original": {
                            "link": "https://d28m5bx785ox17.cloudfront.net/v1/img/XXXL1ifLWa95ZuSyhSLEwS_mmPAFLwqsBvm6-Xz1HdU="
                        },
                        "small": {
                            "link": "https://d28m5bx785ox17.cloudfront.net/v1/img/XXXL1ifLWa95ZuSyhSLEwS_mmPAFLwqsBvm6-Xz1HdU=/w/150"
                        },
                        "medium": {
                            "link": "https://d28m5bx785ox17.cloudfront.net/v1/img/XXXL1ifLWa95ZuSyhSLEwS_mmPAFLwqsBvm6-Xz1HdU=/w/300"
                        },
                        "large": {
                            "link": "https://d28m5bx785ox17.cloudfront.net/v1/img/XXXL1ifLWa95ZuSyhSLEwS_mmPAFLwqsBvm6-Xz1HdU=/w/600"
                        },
                        "extraLarge": {
                            "link": "https://d28m5bx785ox17.cloudfront.net/v1/img/XXXL1ifLWa95ZuSyhSLEwS_mmPAFLwqsBvm6-Xz1HdU=/w/1080"
                        },
                        "smallSquare": {
                            "link": "https://d28m5bx785ox17.cloudfront.net/v1/img/XXXL1ifLWa95ZuSyhSLEwS_mmPAFLwqsBvm6-Xz1HdU=/sc/150x150"
                        },
                        "mediumSquare": {
                            "link": "https://d28m5bx785ox17.cloudfront.net/v1/img/XXXL1ifLWa95ZuSyhSLEwS_mmPAFLwqsBvm6-Xz1HdU=/sc/300x300"
                        },
                        "largeSquare": {
                            "link": "https://d28m5bx785ox17.cloudfront.net/v1/img/XXXL1ifLWa95ZuSyhSLEwS_mmPAFLwqsBvm6-Xz1HdU=/sc/600x600"
                        },
                        "extraLargeSquare": {
                            "link": "https://d28m5bx785ox17.cloudfront.net/v1/img/XXXL1ifLWa95ZuSyhSLEwS_mmPAFLwqsBvm6-Xz1HdU=/sc/1080x1080"
                        },
                        "type": "photo"
                    },
                    "type": "video"
                },
                "products": [
                    {
                        "id": "s_2131_603553eb144f8281a97f8fc74c125620856dbdc807aaa725438101ec9a02fb96",
                        "name": "Product 2",
                        "images": [
                            {
                                "id": "XXXmJm2cPcre6_TXxaMioHILES16D21H7OHIGHJJzjk=",
                                "original": {
                                    "link": "https://d28m5bx785ox17.cloudfront.net/v1/img/XXXmJm2cPcre6_TXxaMioHILES16D21H7OHIGHJJzjk="
                                },
                                "small": {
                                    "link": "https://d28m5bx785ox17.cloudfront.net/v1/img/XXXmJm2cPcre6_TXxaMioHILES16D21H7OHIGHJJzjk=/w/150"
                                },
                                "medium": {
                                    "link": "https://d28m5bx785ox17.cloudfront.net/v1/img/XXXmJm2cPcre6_TXxaMioHILES16D21H7OHIGHJJzjk=/w/300"
                                },
                                "large": {
                                    "link": "https://d28m5bx785ox17.cloudfront.net/v1/img/XXXmJm2cPcre6_TXxaMioHILES16D21H7OHIGHJJzjk=/w/600"
                                },
                                "extraLarge": {
                                    "link": "https://d28m5bx785ox17.cloudfront.net/v1/img/XXXmJm2cPcre6_TXxaMioHILES16D21H7OHIGHJJzjk=/w/1080"
                                },
                                "smallSquare": {
                                    "link": "https://d28m5bx785ox17.cloudfront.net/v1/img/XXXmJm2cPcre6_TXxaMioHILES16D21H7OHIGHJJzjk=/sc/150x150"
                                },
                                "mediumSquare": {
                                    "link": "https://d28m5bx785ox17.cloudfront.net/v1/img/XXXmJm2cPcre6_TXxaMioHILES16D21H7OHIGHJJzjk=/sc/300x300"
                                },
                                "largeSquare": {
                                    "link": "https://d28m5bx785ox17.cloudfront.net/v1/img/XXXmJm2cPcre6_TXxaMioHILES16D21H7OHIGHJJzjk=/sc/600x600"
                                },
                                "extraLargeSquare": {
                                    "link": "https://d28m5bx785ox17.cloudfront.net/v1/img/XXXmJm2cPcre6_TXxaMioHILES16D21H7OHIGHJJzjk=/sc/1080x1080"
                                },
                                "type": "photo"
                            }
                        ],
                        "price": {
                            "display": "120",
                            "value": 120,
                            "currencySymbol": "$",
                            "currencyCode": "USD"
                        },
                        "link": "https://www.example.com/product2",
                        "metadata": {
                            "manufacturer": "Manufacturer2",
                            "isAvailable": "true",
                            "curalateProductId": "p_2131_XXX213f63e08ca7bc044cc1aa13a2b7e914a6fe2e8a6955296ccc90cfc184e63",
                            "productId": "02"
                        },
                        "spatialTag": {
                            "x": 0.5870736241340637,
                            "y": 0.7816091775894165,
                            "label": "1"
                        }
                    }
                ],
                "labels": [

                ]
            }
        ],
        "resultsCount": 362
    },
    "metadata": {
        "traceId": "XXX2a04f-5b69-4260-bdb5-71c537c86515",
        "requestId": "XXXb3128-b20b-4f02-b98f-a511581e4b66",
        "curalateUserId": "XXX935f0-0608-4a0f-895e-9efd0e7bc5b0"
    },
    "paging": {
        "cursors": {
            "after": "XXXc9a2f-dc4a-4e41-b81f-b84d28727fe8_1574614010000"
        },
        "next": "https://api-2.curalate.com/v1/media/MHBrBkXLABehgrzQ?limit=2&after=XXXc9a2f-dc4a-4e41-b81f-b84d28727fe8_1574614010000"
    }
}
"""

}
