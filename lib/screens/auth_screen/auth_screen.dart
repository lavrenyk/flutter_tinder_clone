import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:tinder_clone/screens/main_screen.dart';

class AuthScreen extends StatefulWidget {
  static String routeName = '/auth';

  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final LocalAuthentication auth = LocalAuthentication();
  _SupportState _supportState = _SupportState.unknown;
  bool? _canCheckBiometrics;
  List<BiometricType>? _availableBiometrics;
  String _authorized = 'Not Authorized';
  bool _isAuthenticating = false;

  @override
  void initState() {
    super.initState();
    auth.isDeviceSupported().then(
          (isSupported) => setState(
            () => _supportState = isSupported
                ? _SupportState.supported
                : _SupportState.unsupported,
          ),
        );
  }

  Future<void> _getAvailableBiometrics() async {
    late List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      availableBiometrics = <BiometricType>[];
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _availableBiometrics = availableBiometrics;
    });
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      authenticated = await auth.authenticate(
          localizedReason: 'Let OS determine authentication method',
          useErrorDialogs: true,
          stickyAuth: true);
      setState(() {
        _isAuthenticating = false;
      });
    } on PlatformException catch (e) {
      print(e);
      setState(() {
        _isAuthenticating = false;
        _authorized = "Error - ${e.message}";
      });
      return;
    }
    if (!mounted) return;

    setState(
        () => _authorized = authenticated ? 'Authorized' : 'Not Authorized');
  }

  Future<void> _checkBiometrics() async {
    late bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      canCheckBiometrics = false;
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
    });
  }

  Future<void> _authenticateWithBiometrics() async {
    bool authenticated = false;
    try {
      setState(
        () {
          _isAuthenticating = true;
          _authorized = 'Authenticating';
        },
      );
      authenticated = await auth.authenticate(
          localizedReason:
              'Scan your fingerprint (or face or whatever) to authenticate',
          useErrorDialogs: true,
          stickyAuth: true,
          biometricOnly: true);
      setState(
        () {
          _isAuthenticating = false;
          _authorized = 'Authenticating';
        },
      );
    } on PlatformException catch (e) {
      print(e);
      setState(
        () {
          _isAuthenticating = false;
          _authorized = "Error - ${e.message}";
        },
      );
      return;
    }
    if (!mounted) return;

    final String message = authenticated ? 'Authorized' : 'Not Authorized';
    setState(
      () {
        _authorized = message;
      },
    );
    Navigator.of(context).pushNamedAndRemoveUntil(
        MainScreen.routeName, (Route<dynamic> route) => false);
  }

  void _cancelAuthentication() async {
    await auth.stopAuthentication();
    setState(() => _isAuthenticating = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: ListView(
          padding: const EdgeInsets.only(top: 30),
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                  radius: 80,
                ),
                const SizedBox(height: 35.0),
                const Text(
                  "Дмитрий, добро пожаловать!",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10.0),
                // if (_supportState == _SupportState.unknown)
                //   const CircularProgressIndicator()
                // else if (_supportState == _SupportState.supported)
                //   const Text("This device is supported")
                // else
                //   const Text("This device is not supported"),
                const Divider(height: 30),
                // Text('Can check biometrics: $_canCheckBiometrics\n'),
                // ElevatedButton(
                //   child: const Text('Check biometrics'),
                //   onPressed: _checkBiometrics,
                // ),
                // const Divider(height: 100),
                // Text('Available biometrics: $_availableBiometrics\n'),
                // ElevatedButton(
                //   child: const Text('Get available biometrics'),
                //   onPressed: _getAvailableBiometrics,
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const DialButton(title: '1'),
                    const SizedBox(width: 30),
                    const DialButton(title: '2'),
                    const SizedBox(width: 30),
                    const DialButton(title: '3'),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const DialButton(title: '4'),
                    const SizedBox(width: 30),
                    const DialButton(title: '5'),
                    const SizedBox(width: 30),
                    const DialButton(title: '6'),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const DialButton(title: '7'),
                    const SizedBox(width: 30),
                    const DialButton(title: '8'),
                    const SizedBox(width: 30),
                    const DialButton(title: '9'),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ignore: sized_box_for_whitespace
                    Container(
                      height: 70,
                      width: 70,
                    ),
                    const SizedBox(width: 30),
                    const DialButton(title: '0'),
                    const SizedBox(width: 30),
                    // ignore: sized_box_for_whitespace
                    Container(
                      height: 70,
                      width: 70,
                      child: Center(
                        child: TextButton(
                          onPressed: () {
                            _authenticateWithBiometrics;
                          },
                          child: const Icon(
                            Icons.fingerprint,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(height: 100),
                Text('Current State: $_authorized\n'),
                (_isAuthenticating)
                    ? ElevatedButton(
                        onPressed: _cancelAuthentication,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Text("Cancel Authentication"),
                            const Icon(Icons.cancel),
                          ],
                        ),
                      )
                    : Column(
                        children: [
                          ElevatedButton(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                const Text('Authenticate'),
                                const Icon(Icons.perm_device_information),
                              ],
                            ),
                            onPressed: _authenticate,
                          ),
                          ElevatedButton(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(_isAuthenticating
                                    ? 'Cancel'
                                    : 'Authenticate: biometrics only'),
                                const Icon(Icons.fingerprint),
                              ],
                            ),
                            onPressed: _authenticateWithBiometrics,
                          ),
                        ],
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DialButton extends StatelessWidget {
  final String title;

  const DialButton({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: Colors.black12,
          width: 1,
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 24, color: Colors.black87),
        ),
      ),
    );
  }
}

enum _SupportState {
  unknown,
  supported,
  unsupported,
}
