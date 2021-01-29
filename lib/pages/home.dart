import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:socialtutorial/pages/activity_feed.dart';
import 'package:socialtutorial/pages/profile.dart';
import 'package:socialtutorial/pages/search.dart';
import 'package:socialtutorial/pages/timeline.dart';
import 'package:socialtutorial/pages/upload.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final googleSignIn = GoogleSignIn();
  bool isAuth = false;
  GoogleSignInAccount user;
  PageController pageController;
  int pageIndex = 0;
  login() {
    googleSignIn.signIn();
  }

  logout() {
    googleSignIn.signOut();
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    googleSignIn.onCurrentUserChanged.listen((account) {
      handleSignIn(account);
      // check for login errors
    }, onError: (err) {
      print('Error signin in: $err');
    });
    // Reatuthenticate app
    googleSignIn.signInSilently(suppressErrors: false).then((account) {
      handleSignIn(account);
    }).catchError((err) {
      print("Error Sign in: $err");
    });
  }

  handleSignIn(GoogleSignInAccount account) {
    if (account != null) {
      print('user signed in!: $account');
      user = account;
      setState(
        () {
          isAuth = true;
        },
      );
    } else {
      setState(
        () {
          isAuth = false;
        },
      );
    }
  }

  onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  onTap(int pageIndex) {
    if (pageController.hasClients) {
      pageController.jumpToPage(pageIndex);
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  // Reauthenticate user

  Scaffold buildAuthScreen() {
    return Scaffold(
      body: PageView(
        children: [
          Timeline(),
          ActivityFeed(),
          Upload(),
          Search(),
          Profile(),
        ],
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: pageIndex,
        onTap: onTap,
        activeColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.whatshot),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_active),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.photo_camera,
              size: 35.0,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
          ),
        ],
      ),
    );
  }

  Widget logoutButton() {
    return ElevatedButton(
        onPressed: () => logout(),
        child: Text(
          'Logout',
          style: TextStyle(fontSize: 20, fontFamily: "Signatra"),
        ));
  }

  Scaffold buildUnAuthScreen() {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).accentColor
              ]),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'SocialNet',
              style: TextStyle(
                fontFamily: "Signatra",
                fontSize: 90,
                color: Colors.white,
              ),
            ),
            GestureDetector(
              onTap: () => login(),
              child: Container(
                height: 60.0,
                width: 260.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image:
                          AssetImage('assets/images/google_signin_button.png'),
                      fit: BoxFit.cover),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return isAuth ? buildAuthScreen() : buildUnAuthScreen();
  }
}
