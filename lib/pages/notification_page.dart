import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context)!.settings.arguments as RemoteMessage;
    return Scaffold(
      appBar: AppBar(title:const Text('Notification '),),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
const Text('Message: '),
              Text('${message.notification?.body?? 'No message'}',style: const TextStyle(color: Colors.red ),),
                ],
              ),
              
              Text('Title: ${message.notification?.title?? 'No title'}'),
              Column(
                
                children: [
                  Text('Data: ${message.data.toString()}'),
                  Text('Message ID: ${message.messageId}'),
                  Text('Sent At: ${message.sentTime}'),
                  Text('TTL: ${message.ttl}'),
                  Text('From: ${message.from}'),
                ],
              ),
            
            ],
          ),
        ),
      ),
    );
  }
}