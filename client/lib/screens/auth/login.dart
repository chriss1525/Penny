import 'package:client/api/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: const LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
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
          mainAxisAlignment: MainAxisAlignment.center,
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
            const SizedBox(height: 60.0),
            ElevatedButton(
              // make the button full width
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                minimumSize: const Size(double.infinity, 48),
              ),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Logging you in')),
                  );

                  _formKey.currentState!.save();

                  Api api = Api();
                  Response response = await api.auth.login(email, password);

                  if (!context.mounted) return;

                  if (response.statusCode == 200) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Success')),
                    );
                    // save token to shared preferences
                    // redirect to home
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();

                    await prefs.setBool('isLoggedIn', true);
                    await api.setCookie(response.headers['set-cookie']!);

                    if (!context.mounted) return;

                    Navigator.pushNamed(context, '/permissions');
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
              child: const Text('Login'),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/reset-password');
                  },
                  child: const Text('Forgot Password?'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have an account?'),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: const Text('Register'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
