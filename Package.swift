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
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SwiftCurses",
            targets: ["SwiftCurses"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .systemLibrary(name: "Cncurses", pkgConfig: pkgConfig, providers: [.apt(["ncurses"]), .brew(["ncurses"])]),
        .target(
            name: "SwiftCurses",
            dependencies: ["Cncurses"],
            cSettings: [.define("__NCURSES_H", .when(platforms: [.macOS]))]),
        .testTarget(
            name: "SwiftCursesTests",
            dependencies: ["SwiftCurses"]),
    ]
)
