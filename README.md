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

        AutoSizeText()
<b>AutoSizeText()</b> is a library that is used to auto-sized the text when it is too long.
<br>


