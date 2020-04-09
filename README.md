# my-commerce

## Installations

- Clone or download this project
- Go to project directory, then run ```pod install``` from your terminal
- Open ```.xcworkspace``` file


## Requirements

- iOS 13.0+
- Xcode 11.3+
- Swift 5.0+

## Asumptions

- Products in the Seach Page are taken from Home Page
- Search bar in home will be disabled for the first time until the data recieved from server
- API will no longer be accessed if it has been successfully accessed before, except refresh the Home Page or kill the app and re-open
- Every time the app is killed, and then re-open it will start from Login Page again
- Google and Facebook account will automatically log out every time killed the app

#### Note
- Before running Unit/UI Test make sure Signing Profile is the same between Project Target, Unit Test Target and UI Test Target
- All Test Cases should be working fine
