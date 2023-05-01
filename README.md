# QOO Technical Assessment

QOO Flutter Mobile Developer Position Test

## Getting Started

### Overview
The application contain 4 screens:
- 1- Splash Screen.
- 2- Top Stories screen with (Grid View, List View, Portrait and Landscape mode).
- 3- Story Details view with(Portrait, Landscape mode).
- 4- Search Result Screen.

### Final Result

To view the Final result:
- 1- Recorded .mp4 Video in [Google Drive](https://drive.google.com/file/d/1PqoLjhBxJv-Ls7B96A0OpTXB-cxPfNvG/view?usp=sharing).
- 2- Android APK in [Google Drive](https://drive.google.com/file/d/1r7VmTvtnaqFQH-Q4-T4DXipeoN2rBJnD/view?usp=sharing).

### Environment and Version
- This App and its dependencies need  **Flutter sdk: '>=2.19.5 <3.0.0'**
- to run the app please clone the code the in terminal run
  ```flutter pub get```

### Project Structure
I used MVC design pattern, and to make it simple as the app is small,

I used GETx library to handle:
- Route Management.
- State Management.
- Dependency Injection.

also I used **Singleton** in some cases like Network Checker service

**Note**: I already know how to work with Clean Architecture Using **Bloc**, **Provider**, and **Get_it** as Dependency Injection,
but I choose GETx To avoid make structure more complex.

### Files Structure
for each screen in the app, we have 5 files:
- Screen File (View).
- Controller File, will handle the business logic of the screen.
- Binding File, Will Initialize controller and inject it to the screen file when screen initialized.
- Model: Which handle the Data of the view and pass it to controller.
- Service: Which responsible for calling apis and fetching data, (Repository).

### Network Checker
Network checker implemented to check internet status in two scenarios:
- **first one**: When open the app in the splash screen.
- **second one**: as a listener to listen whenever internet connection lost.

### Fetching Data
- To fetch data from NYT public API, I implement [Retrofit](https://pub.dev/packages/retrofit) as **Rest Api Client** and its my first time with it.
- And [Dio](https://pub.dev/packages/dio) as **Http Client**.
- Two Main Endpoints used from NYT public API:
    - 1- **Top stories** endpoint with filter on section name.
    - 2- **article search** endpoint with limit and offset.


### Webview
two ways of webview implemented:
- 1- In App Webview.
- 2- Open Url in mobile browser.

**I tried to cover all main and bonus point with the time frame**,
thanks for your time. 

