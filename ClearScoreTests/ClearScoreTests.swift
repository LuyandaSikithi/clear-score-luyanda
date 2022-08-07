import XCTest
@testable import ClearScore

class ClearScoreTests: XCTestCase {

    var sut: ScoreProtocol!
    
    override func setUp() {
        super.setUp()
        sut = MockedDataResponse()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testNetworkCall() {
        let expectation = self.expectation(description: "success")
        
        sut.getScore { results in
            switch results {
            case .success(let data):
                XCTAssertEqual(data.creditReportInfo?.score, 300)
                expectation.fulfill()
            case .failure(let error):
                print(error.localizedDescription)
                XCTFail()
            }
        }
        self.waitForExpectations(timeout: 10.0)
    }
}
