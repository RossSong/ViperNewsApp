# ViperNewsApp
iOS news app using VIPER architecture. This architecture is based on Single Responsibility Principle. <br />
Alamofire: https://github.com/Alamofire/Alamofire<br />
AlamofireObjectMapper: https://github.com/tristanhimmelman/AlamofireObjectMapper<br />
AlamofireImage: https://github.com/Alamofire/AlamofireImage<br />
PKHUD: https://github.com/pkluz/PKHUD<br />

## View: 
The responsibility of the view is to send the user actions to the presenter and shows whatever the presenter tells it. <br />

## Interactor:
This is the backbone of an application as it contains the business logic. <br />

## Presenter:
It communicates with all other components. Calls the router for wire-framing, Interactor to fetch data (network calls or local data calls), view to update the UI and gets user response from the UI. <br />

## Entity:
It contains basic model objects used by the Interactor. <br />

## Router:
It has all navigation logic for describing which screens are to be shown when. Does the wire-framing. Listen from the presenter about which screen to present and executes it. <br />

![alt text](https://github.com/spacedema/ViperNewsApp/blob/master/ViperNewsApp/Scheme/VIPER.png)
