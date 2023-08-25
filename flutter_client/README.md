# flutter_client

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## Thinking through the automatic recording of transactions flow for Penny.
1. When a user first installs the app, the app requests for read sms permissions.
2. If the user grants the permissions to the app:
    - The app reads all available sms from mpesa.
    - The app breaks down all the messages to different types: eg send_money, pay_bill, buy_goods, etc
    - The app transforms the messages to transaction types within the app
    - The app displays the transactions inside the app
