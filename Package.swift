// swift-tools-version: 5.7
import PackageDescription

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
        .library(
            name: "InfobipRTC",
            targets: ["InfobipRTC"]),
        .library(
            name: "WebRTC",
            targets: ["WebRTC"])
    ],
    targets: [
        .target(name: "MobileMessagingWrapper", dependencies: ["MobileMessaging"]),
        .target(name: "MobileMessagingRTCWrapper", dependencies: ["MobileMessaging", "InfobipRTC", "WebRTC"], swiftSettings: [.define("WEBRTCUI_ENABLED=1")]),
        .binaryTarget(
          name: "MobileMessaging",
          url: "https://github.com/infobip/mobile-messaging-sdk-ios/releases/download/10.9.0/MobileMessaging.xcframework.zip",
          checksum: "0184cc0617a92d4258529609247c432d507c36b650b367dd2d883e74c029010d"),
        .binaryTarget(
            name: "InfobipRTC",
            url: "https://rtc.cdn.infobip.com/ios/2/2.0.3/InfobipRTC.zip",
            checksum: "d4bad8c82c9119ed6538fe4c091e17cfa52ffcbc25d0407ad9603ff1f7ae02c3"),
        .binaryTarget(
            name: "WebRTC",
            url: "https://rtc.cdn.infobip.com/webrtc/ios/1.0.37785/WebRTC.zip",
            checksum: "e790bc6d407cd9d3bd599d847f8e5f52f32d77d826afdc637f668cedfa544f22")
    ]
)
