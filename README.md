# FetchTakeHomeProject
Fetch Take Home Project

# Steps to Run the App
1. Pull project to your local machine
2. Open `FetchTakeHomeProject.xcodeproj` file
3. Run the app

#### Additional Notes:
The `ContentView` preview should also display the app

# Focus Areas
### Architecture:

* MVVM architecture for clear separation of concerns, code reusability, and improved testing capabilities
* Asynchronous progamming for optimal performance and efficient memory management
* Caching to minimize redundant network requests
* No use of external libraries to prevent dependancies and their upkeep

### Concurrency:
In addition to using  `async await`, I also made use of `@MainActor` in the `RecipeListViewModel` and `ImageCacheService` to efficiently manage the main thread for UI updates.
This approach was implemented for the Unit Tests as well.

### UI/UX:
Based off of the requirements of having a single screen display a list of recipes, I chose SwiftUI for the following reasons:

* Responsive and intuitive for customers
* Quick, clean, and readable for developers

#### Additional Notes:
Although there was no UI/UX Mock, I opted for the most natural user experience of scrolling through each recipe as a tile/card

### Performance Optimization: What techniques do you use to create high-performing applications?
* Use of concurrency for efficent app performance
* Efficient image caching to prevent memory leaks and redundant network requests
* No use of external libraries to minimize app size and reduce dependencies
* Use of Xcode Instruments such as `Leaks`, `Network`, and `Swift Concurrency` to quickly monitor app performance

# Time Spent
| Focus  | Time in Hours |
| ------------- | ------------- |
| Architecture | 2 |
| Concurrency | 1 |
| UI/UX | 1 |
| Performance Optimization | 1 |
| Testing | 0.5 |
| Total | 5.5  |

# Trade-offs and Decisions
* Not using an image caching library increased dev time to reduced app size and improve performance
* Did not write Service mocks for unit testing for the sake of time

# Weakest Part of the Project
I would say the UI for being as simple as it is or the lack of Service mocks/unit tests

# External Code and Dependencies
Opted for no dependencies
