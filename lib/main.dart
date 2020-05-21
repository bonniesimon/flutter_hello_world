import 'package:flutter/material.dart';
import 'package:hello_world_flutter/utils/colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Welcome to Flutter',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Palette.gold,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Palette.dark,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Bonnie Simon',
                    style: TextStyle(color: Color(0xFFBCA876)),
                  )
                ],
              ),
            ),
            body: SingleChildScrollView(
              child: Container(
                  //*Fixed the SingleChildScrollView vanishing all my content. It was cuz of the height and width props
                  // height: double.infinity,
                  // width: double.infinity,
                  // color: Color(0xFFBCA876),
                  child: Column(
                    children: [
                      HeroSection(),
                      BioSection(),
                      HeroSection()
                    ],
                  )),
            )));
  }
}

class BioSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Palette.dark,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(height: 20),
          Divider(
            color: Color(0xFF2B2928),
            thickness: 2,
          ),
          SizedBox(height: 20),
          Text("BIO",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Palette.gold)),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
            child: Text(
              "Not special, just normal. Always Learning",
              style: TextStyle(fontSize: 15, color: Palette.gold),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Text(
              "Less energetic teen who got engulped in the world of web development.",
              style: TextStyle(fontSize: 15, color: Palette.gold),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
            child: Text(
              "Explore my site to know more about me",
              style: TextStyle(fontSize: 15, color: Palette.gold),
              textAlign: TextAlign.center,
            ),
          ),
          Center(
            child: Image.network(
                'https://bonniesimon.herokuapp.com/assets/img/ic_expand_more.png',
                color: Palette.gold),
          )
        ],
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://bonniesimon.herokuapp.com/assets/img/WhatsApp%20Image%202019-05-20%20at%2040923%20PM%20edited.jpg'),
              radius: 100),
        ),
        Text("Developer | Designer | Programmer | Gamer",
            textAlign: TextAlign.center, style: TextStyle(fontSize: 20.0)),
      ],
    );
  }
}