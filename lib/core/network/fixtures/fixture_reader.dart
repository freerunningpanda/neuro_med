import 'package:flutter/services.dart';

Future<String> fixture(String name) async {
  return rootBundle.loadString('lib/core/network/fixtures/$name');
}
