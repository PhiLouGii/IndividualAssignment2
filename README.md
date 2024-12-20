# 📺 PRISM- A movie and series recommendation app


![download](https://github.com/user-attachments/assets/d6b3c70a-58de-49e7-885a-a26442869555)

This app, developed with Flutter, uses the TMDB API to offer users an easy way to search for and get recommendations on movies and TV shows, helping you find your next favorite entertainment.

## ✨Features
* Clean and modern UI design
* User-friendly and easy to utilise
* Advanced search feature for movies and tv series
* Display of different tv series and movies (trending, top rated, airing today, popular)
* Detailed information about each selected movie or series.
* Integration with TMDB Api
## 📲Screens Overview
* __Loading Screen:__ Beautiful loading screen that has the app's name and logo on display.
* __Movies Screen:__ Displays a screen of Trending Movies, Top Rated Movies and Upcoming Movies. Users get to swipe through whichever section to see a movie.
* __Series Screen:__ Displays a screen of Popular Series, Top Rated Series and series that are airing on the current day. Users also get to swipe through the carousels to view what series are trending on air.
* __Details Screen:__ This screen displays brief information about the selected movie or series. It shows the synopsis, the release/air date and the rating.
* __Search Screen__ This screen contains a search bar that allows users to search for their desired movies or series and it will instantly display results based of the titles. The user can then press on the selected movie or series to retrieve a summary of it. 
## 📱App Screenshots
![loading screen](https://github.com/user-attachments/assets/44df4751-141c-4a3a-8b2e-229e20e58b27)
![movie detail screen](https://github.com/user-attachments/assets/845b9007-6c16-424f-b781-f190eab16c30)
![movie search screen](https://github.com/user-attachments/assets/d990cb17-072f-4e51-8ea4-ff8f963220e4)
![series screen](https://github.com/user-attachments/assets/a7f98980-a859-451c-99b7-ff63caa62935)
![movies screen](https://github.com/user-attachments/assets/3b13a3f1-de7b-4289-b943-ac7d6ef42e31)
![series detail screen](https://github.com/user-attachments/assets/a5ce226f-efb8-46b2-90ec-f7ed9a83c60b)
![series search screen](https://github.com/user-attachments/assets/50786e5d-9ff3-4275-a836-2b4136d60bb5)


## 🔧Technologies Utilised
* __Framework:__ Flutter
* __API:__ TMDB API to fetch movies and tv series data.
* __http:__ for API communication.
Refer to the pubspec.yaml file for the full list of dependencies.
## 🔑 API
*TMDB: The Movie Database was used in my app to provide access to a rich database of movies, tv series, and associated metadata. 
The purpose of using TMDB API for my app was:
- It offers comprehensive media databse
- Dynamic and up-to-date content.
- Rich Search Functionality
- Global Reach
## ⚙Getting Started
__Follow these steps to set up the app on your local machine__
1. Clone the repository:
   ```bash
   git clone <repository-url>
2. Navigate to the project directory:
   ```bash
   cd prism
3. Install Dependencies:
   ```bash 
   flutter pub get
4. Run the app:
   ```bash
   flutter run
## 🗂Project Structure

```plaintext
lib/
├── api/              # API logic
├── models/           # Data models
├── screens/          # App screens
├── widgets/          # Reusable widgets
├── constants/            # Constants used throughout the app
└── main.dart         # App entry point
```
## ⌛ Future Improvements
* Add user and profiles so that the app can feel more personalised.
* Include a more detailed and thorough search such as breaking it down into categories.
* Create landscape orientation for user preferences as well as light mode.
## ⁉ Challenges
* Error with loading the images for the movies/series: realised I had to include the image path within my work.
* Creating the layout so that images and content was not overlapping each other: went back to the drawing board on the basics of widgets, padding and layout.
## 🤝🏾 Contributing
1. Fork the repository
2. Creature your feature branch
3. Commit your changes
4. Push to the created branch
5. Open a Pull Request
## 📃Licenses
This project is licensed under the __African Leadership University__ License - see the LICENSE file for details.
## 👩🏾‍💻Author
Philippa L. Giibwa.
You have questions or suggestions? Reach me at (p.giibwa@alustudent.com)
