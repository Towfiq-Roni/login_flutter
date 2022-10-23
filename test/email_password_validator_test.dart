import 'dart:html';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main(){
  test('empty email returns error string', () {
    final result = EmailValidator.validate('');
    expect(result, 'Email can not be empty');
  });

  test('non-empty email returns null', () {
    final result = EmailValidator.validate('email');
    expect(result, null);
  });

  // test('empty password returns error string', () {
  //   final result = .validate('');
  //   expect(result, 'Password can not be empty');
  // });
  //
  // test('non-empty password returns null', () {
  //   final result = .validate('password');
  //   expect(result, null);
  // });
}