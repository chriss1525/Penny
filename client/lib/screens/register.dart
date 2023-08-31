import 'package:client/api/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: const RegisterForm(),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              onChanged: (value) => email = value,
              onSaved: (value) => email = value!,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              onChanged: (value) => password = value,
              onSaved: (value) => password = value!,
              obscureText: true,
              autocorrect: false,
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Registering User')),
                  );

                  _formKey.currentState!.save();

                  Api api = Api();
                  Response response = await api.auth.register(email, password);

                  if (!context.mounted) return;

                  if (response.statusCode == 200) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Success')),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(response.body)),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Invalid Data')),
                  );
                }
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
