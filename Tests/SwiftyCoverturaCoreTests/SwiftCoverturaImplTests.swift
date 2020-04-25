//
//  File.swift
//  
//
//  Created by Guillermo Ignacio Enriquez Gutierrez on 2020/04/26.
//

import XCTest

@testable import SwiftyCoverturaCore

final class SwiftyCoverturaImplTests: XCTestCase {
    func testListTargets() throws {
        
        let report: CodeCoverageReport = {
            let target1 = CodeCoverageReport.Target(buildProductPath: "buildProductPath", coveredLines: 3, executableLines: 3, files: [], lineCoverage: 1.0, name: "Target1.framework")
            let target2 = CodeCoverageReport.Target(buildProductPath: "buildProductPath", coveredLines: 5, executableLines: 10, files: [], lineCoverage: 0.5, name: "Target2")
            let target3 = CodeCoverageReport.Target(buildProductPath: "buildProductPath", coveredLines: 75, executableLines: 100, files: [], lineCoverage: 0.75, name: "Target3")
            let report = CodeCoverageReport(executableLines: 113, targets: [target1, target2, target3], lineCoverage: 0.75, coveredLines: 5)
            return report
        }()
        
        //let input = "/Users/ignacio/Documents/code/nacho4d/TaggedString/xcodeTestResults.xcresult"
        let c = SwiftyCoverturaImpl(inputPath: "whatever", coverageReport: report)
        let targets = c.listTargets()
        XCTAssertEqual(targets, ["Target1.framework", "Target2", "Target3"])
    }
}