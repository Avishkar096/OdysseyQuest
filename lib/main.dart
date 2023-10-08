import 'package:flutter/material.dart';
import 'story_brain.dart';
void main() => runApp(Destini());

class Destini extends StatelessWidget {
  const Destini({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

StoryBrain storybrain = StoryBrain();

class StoryPage extends StatefulWidget {
  const StoryPage({Key? key}) : super(key: key);

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/quil.jpg'), fit: BoxFit.cover),
        ),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 50),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 6,
                child: Center(
                  child: Text(
                    storybrain.getStory() as String,
                    style: TextStyle(fontSize: 25),textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    setState(() {
                      storybrain.nextStory(1);
                    });
                  },
                  child: Text(
                    storybrain.getChoice1() as String,
                    style: TextStyle(fontSize: 20,color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                flex: 1,
                child: Visibility(
                  visible: storybrain.buttonShouldBeVisible()  ,

                  child: TextButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () {
                      setState(() {
                        storybrain.nextStory(2);
                      });

                    },
                    child: Text(
                      storybrain.getChoice2() as String,
                      style: TextStyle(fontSize: 20,color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
