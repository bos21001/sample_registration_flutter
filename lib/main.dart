import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Registration',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(title: 'Sample Registration Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Welcome to Sample Registration Flutter App',
            ),
            MyCustomForm(),
          ],
        ),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.person_outline),
              hintText: 'What is your name?',
              labelText: 'Name *',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your Name';
              }
              if (value.contains('@')) {
                return 'Do not use the @ char.';
              }
              return null;
            },
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              icon: Icon(Icons.add_chart_rounded),
              hintText: 'How old are you?',
              labelText: 'Age *',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your Age';
              }
              return null;
            },
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              icon: Icon(Icons.email_outlined),
              hintText: 'What is your email?',
              labelText: 'Email Address *',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!value.contains('@')) {
                return 'Use the @ char.';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
