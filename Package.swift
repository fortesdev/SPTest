// swift-tools-version: 5.7
import PackageDescription
let targetDependencies: [Target.Dependency]

let package = Package(
    name: "IBMobileMessaging",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "IBMobileMessaging",
            targets: ["MobileMessagingWrapper"]),
	.library(
            name: "IBMobileMessaging",
            targets: ["MobileMessagingRTCWrapper"]),
    ],
    dependencies: [
        .package(url: "https://github.com/infobip/infobip-rtc-ios.git", from: "1.7.0")
    ],
    targets: [
      //  .target(name: "MobileMessagingWrapper", dependencies: ["MobileMessaging"]),
        .binaryTarget(
          name: "MobileMessaging",
          url: "https://github.com/fortesdev/SPTest/blob/main/MobileMessaging.framework.zip",
          checksum: "0184cc0617a92d4258529609247c432d507c36b650b367dd2d883e74c029010d"),
	.binaryTarget(
          name: "MobileMessagingRTC",
          url: "https://github.com/fortesdev/SPTest/blob/main/MobileMessagingWithRTC.framework.zip",
          checksum: "0184cc0617a92d4258529609247c432d507c36b650b367dd2d883e74c029010d"),

        .target(name: "MobileMessagingWrapper", dependencies: ["MobileMessaging"]),
	.target(name: "MobileMessagingRTCWrapper", dependencies: ["MobileMessagingRTC","infobip-rtc-ios"], swiftSettings: [.define("WEBRTCUI_ENABLED=1")]),
	]
)
