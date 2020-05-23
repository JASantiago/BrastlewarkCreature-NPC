//
//  BrastlewarkCreatureNPCTests.swift
//  BrastlewarkCreatureNPCTests
//
//  Created by  Jose  Santiago on 5/22/20.
//  Copyright © 2020  Jose  Santiago. All rights reserved.
//

import XCTest
@testable import BrastlewarkCreature_NPC

let presenter = GnomeListPresenter()

class BrastlewarkCreatureNPCTests: XCTestCase {
    
    var gnomes = [Gnome(id: nil, name: "b", thumbnail: nil, age: nil, weight: nil, height: nil, hair_color: nil, professions: nil, friends: nil), Gnome(id: nil, name: "c", thumbnail: nil, age: nil, weight: nil, height: nil, hair_color: nil, professions: nil, friends: nil), Gnome(id: nil, name: "a", thumbnail: nil, age: nil, weight: nil, height: nil, hair_color: nil, professions: nil, friends: nil)]

    override func setUpWithError() throws {
        presenter.gnomeData = gnomes
    }

    override func tearDownWithError() throws {

    }
    
    func testGnomesFilter() {
        presenter.filterData("a")
        XCTAssertEqual(presenter.filteredData.count, 1)
    }
    
    func testGnomesSort() {
        let sorted = presenter.sortGnomes(gnomes)
        XCTAssertEqual(sorted[0].name!, "a")
        XCTAssertEqual(sorted[1].name!, "b")
        XCTAssertEqual(sorted[2].name!, "c")
    }
    
    func testImageCacheDownload() {
        let imageExpectation = expectation(description: "Cache manager will try to donwload from the web")
        UIImageView().getImageFromCache(urlString: "https://www.w3schools.com/w3css/img_lights.jpg") { (response) in
            XCTAssertNotNil(response)
            imageExpectation.fulfill()
        }
        waitForExpectations(timeout: 30) { (error) in
            if let error = error {
                XCTFail("Timeout\(error)")
            }
        }
    }

    func testGetGnomesData() {
        let networkExpectation = expectation(description: "Network manager calls for getPopulation, it will return a Gnome array or nil if error")
        presenter.networkManager.getPopulation { (response) in
            XCTAssertNotNil(response)
            networkExpectation.fulfill()
        }
        waitForExpectations(timeout: 30) { (error) in
            if let error = error {
                XCTFail("Timeout\(error)")
            }
        }
    }

}
