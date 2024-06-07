import 'package:flutter/material.dart';
import 'package:flutter_practice/pages/addchild.dart';
import 'package:flutter_practice/pages/vacca_page.dart';
import 'package:flutter_practice/pages/vaccines_page.dart';
import 'package:flutter_practice/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kids Vaccination"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VaccaPage(),
                ));
          },
          child: Row(
            children: [
              AnimatedContainer(
                duration: Duration(seconds: 1),
                height: 200,
                width: 200,
                alignment: Alignment.bottomCenter,
                child: Text(
                  "All vaccines",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w100,
                      fontStyle: FontStyle.italic,
                      fontSize: 20),
                ),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      image: NetworkImage(
                        scale: 5,
                        "https://cdn-icons-png.flaticon.com/512/4875/4875551.png",
                      ),
                    ),
                    borderRadius: BorderRadius.circular(100)),
              ),
              SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddChild(),
                      ));
                },
                child: Row(
                  children: [
                    AnimatedContainer(
                      duration: Duration(seconds: 1),
                      height: 200,
                      width: 200,
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "Add Child",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w100,
                            fontStyle: FontStyle.italic,
                            fontSize: 20),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          image: DecorationImage(
                            image: NetworkImage(
                              scale: 2,
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9Lf-hJqafA3yPwh5IVkuOev12OZrYrYnFsA&usqp=CAU",
                            ),
                          ),
                          borderRadius: BorderRadius.circular(100)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
