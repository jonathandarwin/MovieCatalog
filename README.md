# Movie Catalog

<img src="https://user-images.githubusercontent.com/48744669/61883128-0b9c8000-af24-11e9-862f-3b3d46ab4d08.gif" width="50%"/>

## Splash
    Hero(            
      tag: 'title',
      child: Image.asset('assets/logo.png')
    ),
<b>Hero</b> is used to give an animation to widget from the init layout to the next layout. In this case, the Image will be animated from the <b>SplashLayout</b> to the <b>HomeLayout</b>
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
