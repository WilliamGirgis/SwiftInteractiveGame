// swift-tools-version:4.0
import PackageDescription

let package = Package(
	name: "Swift_Group9",
	dependencies: [
		.package(url: "https://ds-git.fstc.uni.lu/Frameworks/interactive-fiction-framework.git", from:("0.0.2"))
	],
	targets: [
		.target(name: "Swift_Group9",dependencies: ["InteractiveFictionFramework"], path: "Sources")
	]
)
