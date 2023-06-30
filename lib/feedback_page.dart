import 'package:flutter/material.dart';
import 'package:loginpage/main.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  String feedbackText = '';

  void submitFeedback() {
    // Implement the logic to handle the submission of feedback
    // You can use the feedbackText variable to access the entered feedback
    // For example, you can send it to a backend server or store it locally
    // You can also display a confirmation message to the user

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Thank You!'),
          content: Text('Your feedback has been submitted.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
                showNotificationSnackBar();
              },
            ),
          ],
        );
      },
    );
  }

  void showNotificationSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Thank you for the feedback!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Enter your feedback',
              ),
              onChanged: (value) {
                setState(() {
                  feedbackText = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: submitFeedback,
              child: Text('Submit Feedback'),
            ),
          ],
        ),
      ),
    );
  }
}


