// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, library_private_types_in_public_api, unused_local_variable, avoid_print, non_constant_identifier_names
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';
// import 'question.dart';
import 'quiz_brain.dart';
QuizBrain quizBrain = QuizBrain();
void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //   title: Center( child: Text("hi"),),),
        //   backgroundColor: Colors.teal,
        // ),
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          title: Center(child: Text('Quizzler')),
          backgroundColor: Colors.red,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // List<Widget> scorekeeper = [
  //   Icon(
  //     Icons.check,
  //     color: Colors.green,
  //   ),
  //   Icon(
  //     Icons.close,
  //     color: Colors.redAccent,
  //   )
  // ];
  List<Widget> scorekeeper = [];
  void checkAnswer(bool userAnswer){
      bool correctAnswer =  quizBrain.getQuestionAnswer();
      setState(  () {          
                  if (quizBrain.isFinished() == true) {
                      Alert(
                        context: context,
                        title: 'Finished!',
                        desc: 'You\'ve reached the end of the quiz.',
                      ).show();
                      quizBrain.reset();
                      scorekeeper = [];
                  }
                  else{
                    if(correctAnswer==userAnswer){
                    print("User is right!!");
                    scorekeeper.add(
                        Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                      );
                  }else{
                    scorekeeper.add(
                        Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                      );
                  }
                  //The user picked true.
                  
                    
                      quizBrain.nextQuestion();
}
                  
                    
                    },
                  );
  }
  // List<String> ques = [
  //   'You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quarter of human bones are in the feet.',
  //   'A slug\'s blood is green.'
  // ];


  // List<bool> answers = [false,true,true];
  // // ignore: non_constant_identifier_names
  

  // Question q1 = Question(a: 'You can lead a cow down stairs but not up stairs.', q: false);
  // List<Question> questionBank = [
  //   Question(q: 'You can lead a cow down stairs but not up stairs.', a: false),
  //   Question(q: 'Approximately one quarter of human bones are in the feet.', a: true),
  //   Question(q: 'A slug\'s blood is green.', a: true),
  //  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                iconColor: Colors.white,
                backgroundColor: Colors.green,
              ),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAnswer(true);                
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                 checkAnswer(false);
              },
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: scorekeeper,
          ),
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/