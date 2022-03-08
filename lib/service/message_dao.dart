

import 'package:firebase_database/firebase_database.dart';

class MessageDao {
  final DatabaseReference _messagesRef =
  FirebaseDatabase.instance.ref().child('messages');

  void saveMessage(Message message) {
    _messagesRef.set(message.toJson()).then((value) {
      print('success');
    }).onError((error, stackTrace) {
      print(error);
    });
  }

  Query getMessageQuery() {
    return _messagesRef;
  }
}