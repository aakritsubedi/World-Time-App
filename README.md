# WorldClock

A flutter project that displays world time ...

## Getting Started

Flutter is an open-source UI software development kit created by Google. It is used to develop applications for Android, iOS, Linux, Mac, Windows, Google Fuchsia, and the web from a single codebase. The first version of Flutter was known as codename "Sky" and ran on the Android operating system.

#### Creating a new project

```shell
$ flutter create <project_name>
```

this will create a sample app...  
remove all the unnecessary codeblocks and initilize the blank application to get started.

- initilize your project cleaning up all the unnecessary codebase using materail design ui, that looks like following screenshot.  
  ![InitialAppScreen](./screenshots/InitialAppScreen.png)

- create a basic layout for different routes you have.
  here, we have created **home, loading and chooseLocation** pages in [lib directory](https://github.com/aakritsubedi/World-Time-App/tree/master/lib).  
  We can link the pages in main darts simply as passing the relative path or importing as a packages likewise in main file.
  `import 'package:WorldClock/pages/home.dart';`

- adding a routes  
  add a route to navigate between different routes to navigate between from routes.
  ![Routing](./screenshots/routing.gif)

- Flutter Packages  
  Find the packages [here](https://pub.dev/packages/).

- gettting data from API  
  the api endpoint used is [http://worldtimeapi.org/](http://worldtimeapi.org/)

```dart
void getTime() async {
    // Make a request
    Response response = await get('http://worldtimeapi.org/api/timezone/Asia/Kathmandu');
    Map data = jsonDecode(response.body);

    // get properties from data
    String datetime = data['datetime'];
    String offsetHrs = data['utc_offset'].substring(1,3);
    String offsetMin = data['utc_offset'].substring(4,6);

    // Create a date time object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offsetHrs), minutes: int.parse(offsetMin)));
    print(now);

  }
```

- getting world time
  Initilize a seperate class handling all time functionalities and import the class where necessary.
  Add such services in services folder inside lib directory like [WorldTime Class](./lib/services/worldTime.dart).

```dart
  import 'package:WorldClock/services/worldTime.dart';

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Kathmandu', flag: 'nepal.png', url:'Asia/Kathmandu');
    await instance.getTime();

    setState(() {
      time = instance.time;
    });

  }
```

- Error Handling
  using `try...catch` block

```dart
  try {
    //do something
  }
  catch (e) {
    print('Error caught $e');
  }
```

- Pushing to other routes and sending data

```dart
    // Redirect to other routes
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag
    });
```

using the data in the receiver route
declare the Map and initilize it ... `Map data = {};`  
store the data in the **build** function `data = ModalRoute.of(context).settings.arguments;`

- Updating the time
  receive the data from **Navigator.pop** in following manner

```dart
FlatButton.icon(
  onPressed: () async {
  dynamic result = await Navigator.pushNamed(context, '/location');
  if (result != null) {
    setState(() {
    data = {
      'time': result['time'],
      'location': result['location'],
      'isDay': result['isDay'],
      'flag': result['flag']
    };
  });
  }
  },
)
```

### Demo on the World Time App
![Demo](./screenshots/demo.gif)

---

For help getting started with Flutter, view flutter
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
