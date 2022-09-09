// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
var pkgConfig: String? = nil

#if os(macOS)
    pkgConfig = "ncurses"
#endif

let package = Package(
    name: "SwiftNCurses",
    products: [
        .library(
            name: "SwiftNCurses",
            targets: ["SwiftNCurses"]),
    ],
    targets: [
        .systemLibrary(name: "Cncurses", pkgConfig: pkgConfig, providers: [.apt(["ncurses"]), .brew(["ncurses"])]),
        .target(
            name: "SwiftNCurses",
            dependencies: ["Cncurses"],
            cSettings: [.define("__NCURSES_H", .when(platforms: [.macOS]))]),
        .testTarget(
            name: "SwiftCursesTests",
            dependencies: ["SwiftNCurses", "Cncurses"],
            cSettings: [.define("__NCURSES_H", .when(platforms: [.macOS])),
                        .define("NCURSES_UNCTRL_H_incl")])
    ]
)
