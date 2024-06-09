/*:


&nbsp;

[< Previous](@previous)           [Home](Introduction)           [Next >](@next)
# Deprecate @UIApplicationMain and @NSApplicationMain

[SE-0383](https://github.com/apple/swift-evolution/blob/main/proposals/0383-deprecate-uiapplicationmain-and-nsapplicationmain.md) formally deprecates the `@UIApplicationMain` and `@NSApplicationMain` attributes, encouraging folks to switch across to the general-purpose `@main` attribute that was introduced back in Swift 5.3.

Adopting this change is trivial. You should be able to change this code:
*/
import SwiftUI 

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    // your code here
}
/*:
To this:
*/
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    // your code here        
}
/*:
Or if you're using SwiftUI, just this:
*/
@main
struct SandboxApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
/*:

&nbsp;

[< Previous](@previous)           [Home](Introduction)           [Next >](@next)
*/