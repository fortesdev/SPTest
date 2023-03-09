// swift-tools-version: 5.7
import PackageDescription
let targetDependencies: [Target.Dependency]

let package = Package(
    name: "IBMobileMessaging",
    platforms: [
        .iOS(.v12)
    ],
    products: [
/*        .library(
            name: "InfobipMobileMessaging",
            targets: ["MobileMessagingWrapper"]),*/
        .library(
            name: "IBMobileMessaging",
            targets: ["MobileMessagingWrapper"]),
    ],
    dependencies: [
        .package(url: "https://github.com/infobip/infobip-rtc-ios.git", from: "1.7.0")
    ],
    targets: [
      //  .target(name: "MobileMessagingWrapper", dependencies: ["MobileMessaging"]),
        .binaryTarget(
          name: "mobile-messaging-sdk-ios",
          url: "https://github.com/infobip/mobile-messaging-sdk-ios/releases/download/10.9.0/MobileMessaging.xcframework.zip",
          checksum: "0184cc0617a92d4258529609247c432d507c36b650b367dd2d883e74c029010d"),

        .target(name: "MobileMessagingWrapper", dependencies: ["mobile-messaging-sdk-ios","infobip-rtc-ios"], swiftSettings: [.define("WEBRTCUI_ENABLED=1")]),
	]
)
