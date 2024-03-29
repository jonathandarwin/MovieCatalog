# Movie Catalog

<img src="https://user-images.githubusercontent.com/48744669/61883128-0b9c8000-af24-11e9-862f-3b3d46ab4d08.gif" width="50%"/>

## Splash
    Hero(            
      tag: 'title',
      child: Image.asset('assets/logo.png')
    ),
<b>Hero</b> is used to give an animation to widget from the init layout to the next layout. In this case, the Image will be animated from the <b>SplashLayout</b> to the <b>HomeLayout</b>. Don't forget to give a 'tag' to the Hero in init layout and the next layout. The purpose of giving the tag is to let the framework know that widget that have this tag will be animated to the position at the widget with the same tag in the next layout.
<br>
<br>
<b>Note : if you wrap Hero() in the widget that inside List, please give a unique tag such as 'image$i', otherwise you will counter an error : Multiple tag in the same layout</b>
<br>

    Navigator.of(context).pushReplacement(PageRouteBuilder(
      pageBuilder: (context, animation, duration) {
        return HomeLayout();
      },
      transitionDuration: Duration(seconds: 2)
    ));
<b>pushReplacement()</b> is used when you want to pop the current layout after <i>intent (in android)</i> to the other layout, same as when you intent to other activity and then you call <b>finish()</b> at current activity (in android).
<br>
To give a transition duration, please use <b>PageRouteBuilder</b> (MaterialPageRoute doesn't have property for setting transition duration)
<br>

## Home
    SafeArea(
      ...
    );
<b>SafeArea()</b> is used when you want your layout below the notification bar. if you don't use this widget, your top-sided layout will be blocked by the notification bar.
<br>

    Column(
        ...
    )
<b>Column()</b> is as same as <b>LinearLayout</b> with vertical orientation in android. it means that the widget <i>inside</i> the column() will be stacked vertically.
<br>

    FutureBuilder(
        future : ... ,
        initialData : ...,
        builder : (context, snapshot) {
            return ...
        }
    )
<b>FutureBuilder()</b> is very useful when you load a data from API and display it in the view. In this case, FutureBuilder is used to display 'Now Playing Movie' from API. it has 3 mandatory parameters :
<br>
1. future : what function that will return the value from the API
2. initialData : set the initial data when we waited the data from API
3. builder : the callback that will be run at the first time and when we get the data from API.
<br>

    MediaQuery.of(context).size
    
    final double itemHeight = size.height / 2;
    final double itemWidth = size.width / 2;
<b>MediaQuery.of(context).size</b> will return the width and height size of your screen.
<br>

    GridView.count(
      crossAxisCount: 2,
      childAspectRatio: (itemWidth / itemHeight),
      children: ...
    );
<b>GridView.count()</b> is used when you want to make a list with a grid. The mandatory parameter is:
<br>
1. crossAxisCount : tell the framework how many grid do you want to make (horizontally)
2. children : tell the framework what widget that held the list
<b>Additional parameter</b>
3. childAspectRatio : the ratio of the child widget. otherwise, it will set as default by the widget.
<br>

        List.generate(listMovie.length, (i){
            ...
        }
<b>List.generate()</b> is used to build the list. it has 2 parameters :
<br>
1. length of the list
2. the callback function for setting the widget in the list
<br>

       FadeInImage.memoryNetwork(
           ....
       );
<b>FadeInImage.memoryNetwork()</b> is another kind of animation that is used to give an animation while we load the image from the network / internet.
<br>

        AutoSizeText(
            ...
        )
<b>AutoSizeText()</b> is a library that is used to auto-sized the text when it is too long. Before we used this widget, please add the dependency in 'pubspec.yaml'
<br>
<b>For more information, please visit this link : https://pub.dev/packages/auto_size_text</b>
<br>

## Detail
    SingleChildScrollView(
        ...
    )
To avoid the <b>bottom overflow </b> when we have a widget outsided the layout, we used <b>SingleSchildScrollView()</b>. This widget makes our layout scrollable.
<br>

    Stack(
        ...
    )
<b>Stack</b> is same as the <b>RelativeLayout in android</b>. when you don't set the position of the widget inside the Stack(), all your widget will be positioned in (0,0) of the parent. The order of the widget inside the Stack() is matter. The concept is like the Stack in <b>Data Structure</b>. when you put a new value in the stack, that new value will be positioned at the top of the previous value.
<br>
To manage the position of your widget inside the Stack(), the common approach is to wrap your widget with <b>Positioned()</b> or <b>Align()</b> and set the position in that wrapper.

    Row(
        ...
    )
<b>Row()</b> is same as <b>LinearLayout</b> with horizontal orientation (in android).


## HomeBloc
<b>HomeBloc</b> is a class that perform some business logic in the HomeLayout.

## MovieRepository
<b>MovieRepository</b> is a class that responsible to make some HTTP request to get the data. To get the data from API, we use 'http' dependency. When you do some API request, please use Future<> and async-await to make the flow of your apps become asynchronous.

## Movie (Model)
<b>Movie</b> is a model class to represent the data. The constructor has some difference than the other OOP language. In Flutter (that used Dart Language from Google) have a <b>Unnamed Constructor</b> and <b>Named Constructor</b>.
<br>
### Unnamed Constructor
1 class only have 1 unnamed constructor. This constructor is used to set the value of the property in the class automatically.

        Movie({            
            this.title,
            this.poster_path,
            this.backdrop_path,
            this.overview,
            this.release_date,
            this.vote_average
          });

From the snippet code above, the unnamed constructor for Movie class will assign a value for title, poster_path, and so on.

### Named Constructor
You can have many named constructor in 1 class. The named constructor is written like this :
        
    factory Movie.fromJson(Map<String, dynamic> json){
        return Movie(
          title: json['title'],
          overview: json['overview'],
          poster_path: json['poster_path'],
          backdrop_path : json['backdrop_path'],
          release_date: json['release_date'],
          vote_average: json['vote_average'].toString()
        );
    }     
The written of the constructor is : the name of the class + '.' + the name of the constructor.
Notice that we used keyword 'factory' behind the named constructor. Simply, factory is like static method.

## DateUtil
<b>DateUtil</b> is used to convert raw-date-format (2019-05-12) to display-date-format (May 12, 2019). In this util, we use date_format dependency to convert the date with the pattern that we defined.
<br>
For more information about date_format, please visit this link : https://pub.dev/packages/date_format

# Related Link
1. AutoTextSize : https://pub.dev/packages/auto_size_text
2. Animation in flutter : https://flutter.dev/docs/development/ui/animations
3. http : https://pub.dev/packages/http
4. http documentation : https://flutter.dev/docs/cookbook/networking/fetch-data
5. Hero documentation : https://flutter.dev/docs/development/ui/animations/hero-animations
6. BLoC pattern : https://www.youtube.com/watch?v=oxeYeMHVLII
7. factory : https://stackoverflow.com/questions/52299304/dart-advantage-of-a-factory-constructor-identifier
8. GridView and List.generate documentation : https://flutter.dev/docs/cookbook/lists/grid-lists
9. Stack : https://medium.com/flutter-community/a-deep-dive-into-stack-in-flutter-3264619b3a77
10. date_format : https://pub.dev/packages/date_format
