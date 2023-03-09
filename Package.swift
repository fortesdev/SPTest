let targetDependencies: [Target.Dependency]

let package = Package(
    name: "InfobipMobileMessaging",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "InfobipMobileMessaging",
            targets: ["MobileMessagingWrapper"]),
        .library(
            name: "InfobipMobileMessagingRTC",
            targets: ["MobileMessagingRTCWrapper"]),
    ],
    dependencies: [
        .package(name: "InfobipRTC", url: "https://github.com/infobip/infobip-rtc-ios.git", from: "1.7.0"),
        .package(name: "MobileMessaging", url: "https://github.com/infobip/mobile-messaging-sdk-ios.git", from: "1.9.0")
    ]
    targets: [
        .target(name: "MobileMessagingWrapper", dependencies: ["MobileMessaging"]),
        .target(name: "MobileMessagingRTCWrapper", dependencies: ["MobileMessaging", "InfobipRTC"], swiftSettings: [.define("WEBRTCUI_ENABLED=1")]),
	]
)
