import 'package:flutter/material.dart';

class Feedback {
  final String name, userPic;
  final int id;
  final Color color;

  Feedback(
      {required this.name,
      required this.userPic,
      required this.id,
      required this.color});
}

// List of demo feedbacks
List<Feedback> feedbacks = [
  Feedback(
    id: 1,
    name: "Design Patterns (MVVM, MVC)",
    userPic: "assets/images/person.png",
    color: Color(0xFFFFF3DD),
  ),
  Feedback(
    id: 2,
    name: "StateManagement (Provider-Bloc)",
    userPic: "assets/images/person.png",
    color: Color(0xFFD9FFFC),
  ),
  Feedback(
    id: 3,
    name:
        "Firebase Services(Authentication, Cloud Firestore, Cloud Messaging, Cloud Storage)",
    userPic: "assets/images/person.png",
    color: Color(0xFFFFE0E0),
  ),
];
