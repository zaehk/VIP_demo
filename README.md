# VIP_demo

Demo project to test VIP (Clean swift) design pattern and Snapkit pod.

The app uses the API "themoviedb":
https://developers.themoviedb.org/


VIP is an evolution of VIPER design pattern in which the information flow is unidirectional.
The communication between the components of a scene are made through protocols. This makes each component of a scene less tightly tied to the others. Altough the components are similar to the ones used in VIPER, in VIP, the viewcontroller is the center of the scene, accesing interactor and router directly. Presenter is only used to transform the business logic or data passed from the interactor into a displayable content and send it to the view. This solves one of the main issues with VIPER, being that the presenter is no longer bidirectional and has to deal with navigation and all the viewcontroller inputs. 

![VIP flow](https://miro.medium.com/max/700/0*Q2qPUtCiefnnjdVI)

The app has three main scenes:

HOME: where different categories of movies are displayed with an horizontal carousel. The categories are "Top rated movies", "Popular movies", "New releases" and "upcoming". If some of this movie lists fails to be downloaded, the rest of them will be displayed.

![alt text](https://i.imgur.com/5x5PAak.png)

Also, if every category of movies fails to be downloaded, an empty state with an error will be shown:

![alt text](https://i.imgur.com/QoPtbaB.png)

The screen can be reloaded pulling down so if an error is shown, the user can reload the screen easily.

MOVIE DETAIL: when the user clicks on any movie, a new screen with the movie details will be shown. This screen contains an overview of the vilm, cast members and crew members. Also, if available, a list of reviews will be shown.

![alt text](https://i.imgur.com/9kT14S7.png)

MOVIE SEARCH: The user can type here any query and the app will show movies that match the title. If no movie is found an empty state will be displayed to the user.
Clicking on any of the movies displayed here will redirect the user to the movie detail screen.

![alt text](https://i.imgur.com/yr9fSAL.png)
