# FyberOffers
FyberOffers is a Project to demonstrate the use of [Fyber]'s [Offer API] implementation in iPhone app. 
The application enables user to input UID, APIKey and AppId and it loads the available offers. You can pull
to refresh at the bottom of the list to load next page of offers. Once all offers available are loaded it shows a 
message that no more offers are available.

The iOS app is divided into SDK and Application packages. SDK includes the Fyber model structures and communication 
 to fetch data from it. Application can request data from SDK and SDK's responsibility is to manage every thing else 
 returning final usefull data to Application.
 
 The Application package includes the app user interface, theme and controller implementation to render data. 
 
 The project also includes Unit and UI Tests

<img src="https://github.com/nabeelarif/FyberOffers/blob/master/Screenshots/FyberOffersForm.PNG" alt="Form to input Fyber Credentials" width="308" height="550">
<img src="https://github.com/nabeelarif/FyberOffers/blob/master/Screenshots/FyberOffersError.PNG" alt="Display errors" width="308" height="550">
<img src="https://github.com/nabeelarif/FyberOffers/blob/master/Screenshots/FyberOffersUI.PNG" alt="Offers list UI" width="308" height="550">
<img src="https://github.com/nabeelarif/FyberOffers/blob/master/Screenshots/FyberOffersLoadNextPage.PNG" alt="Load Next page" width="308" height="550">

## Requirements
* Xcode 7 or higher
* iOS 7.0 or higher
* ARC
* Objective-C

## Installation
Copy the project from git OR
Git Clone using following command
```sh
$ git clone https://github.com/nabeelarif/FyberOffers.git
```
You need to install pods before running the project
```sh
$ pod install
```

## Author
Muhammad Nabeel Arif

[Fyber]: <http://developer.fyber.com/>
[Offer API]: <http://developer.fyber.com/content/current/ios/offer-wall/offer-api/>
