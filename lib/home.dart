import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:share/share.dart';
import 'package:vdo_watch/login.dart';

import 'model.dart';
import 'preference.dart';

bool videoOn = false;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    videoList.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: buildTabScreens(),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget buildTabScreens() {
    switch (_currentIndex) {
      case 0:
        return Center(
          child: Container(
            child: Text('Explore Screen'),
          ),
        );
        break;
      case 1:
        return Center(
          child: Container(
            child: Text('Upload Screen'),
          ),
        );
        break;
      case 2:
        return ListView.builder(
          itemBuilder: (context, i) => buildVideoTile(context, i),
          itemCount: videoList.length,
        );
        break;
      case 3:
        return Center(
          child: Container(
            child: Text('Subscription Screen'),
          ),
        );
        break;
      case 4:
        return Center(
          child: Container(
            child: Text('Library Screen'),
          ),
        );
        break;
    }
  }

  Container buildVideoTile(BuildContext context, int i) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      alignment: Alignment.center,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              videoOn = true;
              Scaffold.of(context).showBottomSheet(
                (context) => buildVideoPlayerPage(context, i),
              );
            },
            child: Stack(
              children: [
                Image.asset(
                  videoList[i].imageUrl,
                ),
                Positioned(
                  right: 5,
                  bottom: 5,
                  child: Container(
                    color: Colors.black,
                    child: Text(
                      videoList[i].duration,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 3, bottom: 3),
            width: MediaQuery.of(context).size.width,
            color: Colors.black87,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  child: Icon(
                    Icons.thumb_up_alt_outlined,
                    color: videoList[i].liked ? Colors.blue : Colors.white,
                  ),
                  onTap: () {
                    setState(() {
                      videoList[i].liked = videoList[i].liked ? false : true;
                    });
                  },
                ),
                GestureDetector(
                  onTap: () {
                    Scaffold.of(context).showBottomSheet(
                      (context) => buildVideoPlayerPage(context, i),
                    );
                  },
                  child: Column(
                    children: [
                      Text(
                        videoList[i].name,
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        ' | ' +
                            videoList[i].channel +
                            ' | ' +
                            videoList[i].views +
                            ' views' +
                            ' | ',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Share.share(
                      videoList[i].videoUrl + '\n\n from VDO App',
                    );
                  },
                  child: Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildVideoPlayerPage(BuildContext context, int i) {
    return Stack(
      children: [
        Container(
          child: ListView(
            children: [
              buildVideoPlayer(context, i),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Text(
                  videoList[i].name,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.blue),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Text(
                  videoList[i].views + ' views',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Divider(
                thickness: 2,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      child: Icon(
                        Icons.thumb_up_alt_outlined,
                        color: videoList[i].liked ? Colors.blue : Colors.black,
                      ),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Liked',
                              textAlign: TextAlign.center,
                            ),
                            backgroundColor: Colors.lightBlueAccent[400],
                          ),
                        );
                      },
                    ),
                    GestureDetector(
                      child: Icon(Icons.thumb_down_alt_outlined),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Disliked',
                              textAlign: TextAlign.center,
                            ),
                            backgroundColor: Colors.lightBlueAccent[400],
                          ),
                        );
                      },
                    ),
                    GestureDetector(
                      child: Icon(Icons.share_outlined),
                      onTap: () {
                        Share.share(videoList[i].videoUrl);
                      },
                    ),
                    GestureDetector(
                      child: Icon(Icons.download_outlined),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Download Started',
                              textAlign: TextAlign.center,
                            ),
                            backgroundColor: Colors.lightBlueAccent[400],
                          ),
                        );
                      },
                    ),
                    GestureDetector(
                      child: Icon(Icons.add_box_outlined),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Added to Watch Later',
                              textAlign: TextAlign.center,
                            ),
                            backgroundColor: Colors.lightBlueAccent[400],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 2,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: CircleAvatar(
                        backgroundColor: Colors.black87.withAlpha(150),
                      ),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Opening channel: ${videoList[i].channel}',
                            ),
                            backgroundColor: Colors.lightBlueAccent[400],
                          ),
                        );
                      },
                    ),
                    GestureDetector(
                      child: Text(
                        videoList[i].channel,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Opening channel: ${videoList[i].channel}',
                            ),
                            backgroundColor: Colors.lightBlueAccent[400],
                          ),
                        );
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Subscribed to ${videoList[i].channel}',
                            ),
                            backgroundColor: Colors.lightBlueAccent[400],
                          ),
                        );
                      },
                      child: Text('SUBSCRIBE'),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 2,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Text(
                  'Comments',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: TextField(
                  decoration:
                      InputDecoration(hintText: 'Write your comment here'),
                ),
              ),
              ListTile(
                subtitle: Text(commentList[0].user),
                title: Text(commentList[0].comment),
              ),
              ListTile(
                subtitle: Text(commentList[1].user),
                title: Text(commentList[1].comment),
              ),
              ListTile(
                subtitle: Text(commentList[2].user),
                title: Text(commentList[2].comment),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 50,
          right: -15,
          child: Container(
            color: Colors.transparent,
            child: OutlinedButton(
              style: ButtonStyle(
                side: MaterialStateProperty.all<BorderSide>(
                  BorderSide(color: Colors.lightBlueAccent[400], width: 2),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.red, width: 2),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go Back    '),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildVideoPlayer(context, i) {
    return Stack(
      children: [
        Image.asset(
          videoList[i].imageUrl,
        ),
        Positioned(
          left: 1,
          bottom: 0,
          child: Container(
            color: Colors.lightBlueAccent[400],
            child: Text(
              '0:00/' + videoList[i].duration,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Positioned(
          top: 100,
          left: MediaQuery.of(context).size.width * 0.45,
          child: GestureDetector(
            child: Icon(
              Icons.play_arrow_sharp,
              color: Colors.lightBlue[400],
              size: 60,
            ),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Video Start',
                    textAlign: TextAlign.center,
                  ),
                  backgroundColor: Colors.lightBlueAccent[400],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  var _currentIndex = 2;
  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.lightBlue[400],
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      selectedFontSize: 12,
      showUnselectedLabels: true,
      unselectedFontSize: 12,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.white,
      selectedIconTheme: IconThemeData(size: 30),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.explore_outlined),
          label: 'Explore',
          activeIcon: Icon(Icons.explore),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.add_circle_outline_outlined,
          ),
          label: 'Upload',
          activeIcon: Icon(Icons.add_circle),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
          activeIcon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.subscriptions_outlined),
          label: 'Subscriptions',
          activeIcon: Icon(Icons.subscriptions),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.video_collection_outlined),
          label: 'Library',
          activeIcon: Icon(Icons.video_collection),
        ),
      ],
      onTap: (i) {
        if (videoOn) {
          videoOn = false;
          Navigator.pop(context);
        }
        setState(() {
          _currentIndex = i;
        });
      },
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.lightBlue[400],
      leading: Container(
        margin: EdgeInsets.only(left: 20),
        child: Icon(
          Icons.ondemand_video_outlined,
          color: Colors.black,
          size: 30,
        ),
      ),
      leadingWidth: 40,
      title: Text(
        'VDO',
        style: TextStyle(fontWeight: FontWeight.w300),
      ),
      actions: [
        GestureDetector(
          child: Icon(
            Icons.cast_rounded,
          ),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Cast to other Screens',
                  textAlign: TextAlign.center,
                ),
                backgroundColor: Colors.lightBlueAccent[400],
              ),
            );
          },
        ),
        SizedBox(
          width: 15,
        ),
        Container(
          width: 40,
          child: Stack(
            children: [
              Center(
                child: GestureDetector(
                  child: Icon(
                    Icons.notifications_none_sharp,
                    size: 30,
                  ),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'View Notifications',
                          textAlign: TextAlign.center,
                        ),
                        backgroundColor: Colors.lightBlueAccent[400],
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                top: 10,
                left: 20,
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 10,
                  child: Text(
                    '2',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: 15,
        ),
        SearchBar(context: context),
        SizedBox(
          width: 15,
        ),
        AppBarProfileIcon(),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
    @required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(
        Icons.search_sharp,
        size: 30,
      ),
      onTap: () {
        Scaffold.of(context).showBottomSheet(
            (context) => Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40),
                      ),
                      color: Colors.white),
                  height: 230,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Write here..',
                          ),
                        ),
                      ),
                      OutlinedButton(
                        style: ButtonStyle(
                          side: MaterialStateProperty.all<BorderSide>(
                            BorderSide(
                              color: Colors.lightBlueAccent[400],
                              width: 2,
                            ),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.red, width: 2),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Search'),
                      ),
                    ],
                  ),
                ),
            backgroundColor: Colors.transparent);
      },
    );
  }
}

class AppBarProfileIcon extends StatelessWidget {
  const AppBarProfileIcon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Scaffold.of(context).showBottomSheet(
          (context) => ProfilePage(),
        );
      },
      child: CircleAvatar(
        backgroundColor: Colors.black,
        child: Text(
          loggedInUser[0],
          style: TextStyle(color: Colors.white),
        ),
        radius: 15,
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(loggedInUser),
          Center(
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.lightBlue[400],
                ),
              ),
              child: Text('Log Out'),
              onPressed: () {
                isloggedIn = false;
                loggedInUser = null;
                Preference.setLoggedIn(isloggedIn);
                Preference.setLoggedInUser(loggedInUser);

                Navigator.pushReplacement(
                  context,
                  PageTransition(
                    type: PageTransitionType.topToBottom,
                    child: Login(),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
