// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
var pkgConfig: String? = nil

#if os(macOS)
    pkgConfig = "ncurses"
#endif

let package = Package(
    name: "SwiftCurses",
    products: [
        .library(
            name: "SwiftCurses",
            targets: ["SwiftCurses"]),
    ],
    targets: [
        .systemLibrary(name: "Cncurses", pkgConfig: pkgConfig, providers: [.apt(["ncurses"]), .brew(["ncurses"])]),
        .target(
            name: "SwiftCurses",
            dependencies: ["Cncurses"],
            cSettings: [.define("__NCURSES_H", .when(platforms: [.macOS]))]),
        .testTarget(
            name: "SwiftCursesTests",
            dependencies: ["SwiftCurses"],
            cSettings: [.define("__NCURSES_H", .when(platforms: [.macOS]))])
    ]
)
