# TidalCodingAssignment
Tidal take-home coding assignment

## Build tools & versions used
This app was created using Xcode 26.2. I decided to use the Swift programming language with UIKit to handle the UI elements. I have experience with SwiftUI but I have far more professional experience with Storyboards. I also have experience coding in Objective-C but I prefer using Swift these days, I just find it easier to code in. I decided to use an MVC architecture for the sake of simplicity. MVVM has more extensibility for larger projects and is more conducive to unit testing but for a small project like this I feel MVC is just all round an easier way to go.

## Steps to run the app
In order to run the app, merely open the TidalCodingAssignment.xcodeproj file in Xcode, select the TidalCodingAssignment target from the dropdown, select an appropriate simulator and press Run.

## What areas of the app did you focus on?
Initially I focused on creating the UI elements of the app - implementing the storyboard files and their associated swift counterparts. Then I shifted my focus to creating the NetworkManager class which manages the calls to the API. This went through a couple of revisions as my understanding of the requirements expanded. Once this was completed and integrated into the app to a standard I was pleased with, I shifted my focus to implementing the image caching system and then the unit tests.

## What was the reason for your focus? What problems were you trying to solve?
There was no one primary area of focus when I developed the app, rather I tried to break the requirements down into digestable problems that I could solve one at a time. I used a Jira board (https://gingermcninja.atlassian.net/jira/software/projects/TID/boards/177) to track the progress of each issue I worked on which helped me keep my focus on one issue at a time. Some parts of the code required refactoring in response to newer features - for example the NetworkManager was refactored to be more unit testable, and then refactored further to allow the use of an empty state view.

## How long did you spend on this project?
I spent roughly six hours on this project.

## Did you make any trade-offs for this project? What would you have done differently with more time?
The main trade-off I made was in the UI elements. If I had more time I would like to make the UI prettier. Design was never my strong suit, that's why I love working alongside experienced designers. I'm much more comfortable implementing Figma designs than creating them myself.

## What do you think is the weakest part of your project?
I think the UI - while perfectly serviceable - definitely leaves something to be desired.

## Did you copy any code or dependencies? Please make sure to attribute them here!
I reused some code I have previously written for other personal projects, most notably in the NetworkManager and unit tests. I didn't feel the need to use any third party libraries though.

## Is there any other information you’d like us to know?
As already mentioned, I created a Jira board to track my work which can be viewed here https://gingermcninja.atlassian.net/jira/software/projects/TID/boards/177. I also created a github repository for my work - https://github.com/gingermcninja/TidalCodingAssignment. Since I was the only developer working on the assignment I didn't see the need to implement a particularly complex workflow or branching strategy - I created feature branches that correspond to each ticket on the Jira board and then created a pull request to merge the feature branch directly into main. I also didn't bother to add an 'In Review' column in the Jira board since I was the only reviewer.
