import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/pages/addchild.dart';
import 'package:flutter_practice/pages/home_page.dart';
import 'package:flutter_practice/pages/vacca_page.dart';
import 'package:flutter_practice/pages/vaccines_page.dart';
import 'package:flutter_practice/utils/routes.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageurl = "https://cdn-icons-png.flaticon.com/128/3884/3884999.png";
    return Drawer(
      child: Container(
        color: Colors.blueGrey,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  accountName: Text(
                    'Kids Vaccination',
                    style: TextStyle(fontSize: 20),
                  ),
                  accountEmail:
                      Text('.................................................'),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(imageurl),
                  ),
                )),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text(
                "Home",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(MyRoutes.homeRoute);
              },
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.plus_app,
                color: Colors.white,
              ),
              title: Text(
                "Add child",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddChild(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.person_2,
                color: Colors.white,
              ),
              title: Text(
                "My children",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.table,
                color: Colors.white,
              ),
              title: Text(
                "All vaccines",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VaccaPage(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.alarm_fill,
                color: Colors.white,
              ),
              title: Text(
                "Reminder",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.arrow_3_trianglepath,
                color: Colors.white,
              ),
              title: Text(
                "Appointments",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.question_circle,
                color: Colors.white,
              ),
              title: Text(
                "About us",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.left_chevron,
                color: Colors.white,
              ),
              title: Text(
                "Log out",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(MyRoutes.loginRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}
