import SwiftUI
import testkmp

@main
struct iOSApp: App {
    init() {
        let message = GreetingMessage(
            message: "Test"
        )
        print(message)
    }

    var body: some Scene {
        WindowGroup {
            
        }
    }
}
