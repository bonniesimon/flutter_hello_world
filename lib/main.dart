import 'package:flutter/material.dart';
import 'package:hello_world_flutter/utils/colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Bonnie Simon',
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: Palette.dark,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Palette.gold,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '*To.Doist',
                      style: TextStyle(color: Palette.dark),
                    )
                  ],
                ),
              ),
              body: TodoListPage()),
        ));
  }
}

class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  TextEditingController _textController = TextEditingController();
  List<String> quotes = [
    "This world is so cool!",
    "Hope I'm curious forever",
    "I am what the world wants me to be",
    "Killing a killer does not change "
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          cursorColor: Palette.gold,
          style: TextStyle(color: Palette.white),
          decoration: InputDecoration(
            hintText: "Add Todo",
            hintStyle: TextStyle(color: Palette.white),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                color: Palette.gold,
                style: BorderStyle.none,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:BorderSide(color: Palette.gold)
            )
          ),
          controller: _textController,
          onSubmitted: (value) {
            setState(() {
              quotes.add(value);
              _textController.clear();
            });
          },
        ),
        Expanded(
          child: Container(
            child: ListView.separated(
              itemCount: quotes.length,
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  color: Palette.gold,
                );
              },
              itemBuilder: (context, index) {
                var quote = quotes[index];
                return Dismissible(
                    key: ValueKey(quote),
                    onDismissed: (direction) {
                      setState(() {
                        quotes.removeAt(index);
                      });
                      Scaffold.of(context).showSnackBar(SnackBar(
                          backgroundColor: Palette.gold,
                          content: Container(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Deleted",
                                style: TextStyle(color: Palette.dark),
                              ),
                              Icon(Icons.delete_forever, color: Palette.dark)
                            ],
                          ))));
                    },
                    child: ListTile(
                      title: Text(
                        '${quotes[index]}',
                        style: TextStyle(color: Palette.gold),
                        textAlign: TextAlign.left,
                      ),
                      trailing: Icon(
                        Icons.delete_sweep,
                        color: Palette.gold,
                      ),
                    ));
              },
            ),
          ),
        ),
      ],
    );
  }
}

class HomePagePortfolio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          //*Fixed the SingleChildScrollView vanishing all my content. It was cuz of the height and width props
          // height: double.infinity,
          // width: double.infinity,
          // color: Color(0xFFBCA876),
          child: Column(
        children: [
          HeroSection(),
          BioSection(),
        ],
      )),
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
        SizedBox(height: 20),
      ],
    );
  }
}

class BioSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Palette.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // Divider(
          //   color: Color(0xFF2B2928),
          //   thickness: 2,
          // ),
          SizedBox(height: 20),
          Text("BIO",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Palette.dark)),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
            child: Text(
              "Not special, just normal. Always Learning",
              style: TextStyle(fontSize: 15, color: Palette.dark),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Text(
              "Less energetic teen who got engulped in the world of web development.",
              style: TextStyle(fontSize: 15, color: Palette.dark),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
            child: Text(
              "Explore my site to know more about me",
              style: TextStyle(fontSize: 15, color: Palette.dark),
              textAlign: TextAlign.center,
            ),
          ),
          Center(
            child: Image.network(
                'https://bonniesimon.herokuapp.com/assets/img/ic_expand_more.png',
                color: Palette.dark),
          )
        ],
      ),
    );
  }
}

class LanguagesSection extends StatefulWidget {
  @override
  _LanguagesSectionState createState() => _LanguagesSectionState();
}

class _LanguagesSectionState extends State<LanguagesSection> {
  List<String> quotes = [
    "This world is so cool!",
    "Hope I'm curious forever",
    "I am what the world wants me to be",
    "Killing a killer does not change the total number of killers"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: quotes.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            color: Palette.gold,
            child:
                Text('${quotes[index]}', style: TextStyle(color: Palette.dark)),
          );
        },
      ),
    );
  }
}
