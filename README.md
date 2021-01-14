# VIP_demo

Demo project to test VIP (Clean swift) design pattern and Snapkit pod.

The app uses the API "themoviedb":
https://developers.themoviedb.org/


VIP is an evolution of VIPER design pattern in which the information flow is unidirectional.
The communication between the components of a scene are made through protocols. This makes each component of a scene less tightly tied to the others. Altough the components are similar to the ones used in VIPER, in VIP, the viewcontroller is the center of the scene, accesing interactor and router directly. Presenter is only used to transform the business logic or data passed from the interactor into a displayable content and send it to the view. This solves one of the main issues with VIPER, being that the presenter is no longer bidirectional and has to deal with navigation and all the viewcontroller inputs. 

![VIP flow](https://miro.medium.com/max/700/0*Q2qPUtCiefnnjdVI)

The app has three main scenes:

