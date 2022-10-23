import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login/auth.dart';
import 'package:login/auth_provider.dart';
import 'package:login/firebase_options.dart';
import 'package:login/login.dart';
import 'package:mockito/mockito.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:google_sign_in_mocks/google_sign_in_mocks.dart';

// class MockAuth extends Mock implements BaseAuth{}
//
// void main() {
//   Widget makeTestableWidget({required Widget child, required BaseAuth auth}){
//     // var key;
//     return AuthProvider(
//       auth: auth,
//       child: MaterialApp(
//         home: child,
//       ),
//     );
//   }
//
//   testWidgets('email or password is empty, does not sign in', (WidgetTester tester) async{
//     MockAuth mockAuth = MockAuth();
//     bool didSignIn = false;
//     LogInWidget page = LogInWidget(onClickedSignUp: () => didSignIn =true);
//
//     await tester.pumpWidget(makeTestableWidget(child: page, auth: mockAuth));
//     await tester.tap(find.byKey(Key('signIn')));
//
//     verifyNever(mockAuth.signInWithEmailAndPassword('', ''));
//     expect(didSignIn, false);
//   });
//
//   testWidgets('non-empty email and password, valid account, call sign in, succeed',
//           (WidgetTester tester) async{
//     MockAuth mockAuth = MockAuth();
//     when(mockAuth.signInWithEmailAndPassword('email', 'password'))
//         .thenAnswer((invocation) => Future.value('uid'));
//
//     bool didSignIn = false;
//     LogInWidget page = LogInWidget(onClickedSignUp: () => didSignIn =true,);
//
//     await tester.pumpWidget(makeTestableWidget(child: page, auth: mockAuth));
//
//     Finder emailField = find.byKey(Key('email'));
//     await tester.enterText(emailField, 'email');
//
//     Finder passwordField = find.byKey(Key('password'));
//     await tester.enterText(passwordField, 'password');
//
//     await tester.tap(find.byKey(Key('signIn')));
//
//     verify(mockAuth.signInWithEmailAndPassword('email', 'password')).called(1);
//     expect(didSignIn, true);
//   });
//
//   testWidgets('non-empty email and password, valid account, call sign in, fails',
//       (WidgetTester tester) async{
//     MockAuth mockAuth = MockAuth();
//     when(mockAuth.signInWithEmailAndPassword('email', 'password'))
//         .thenThrow(StateError('invalid credentials'));
//
//     bool didSignIn = false;
//     LogInWidget page = LogInWidget(onClickedSignUp: () => didSignIn = true,);
//
//     await tester.pumpWidget(makeTestableWidget(child: page, auth: mockAuth));
//
//     Finder emailField = find.byKey(Key('email'));
//     await tester.enterText(emailField, 'email');
//
//     Finder passwordField = find.byKey(Key('password'));
//     await tester.enterText(passwordField, 'password');
//
//     await tester.tap(find.byKey(Key('signIn')));
//
//     verify(mockAuth.signInWithEmailAndPassword('email', 'password')).called(1);
//     expect(didSignIn, false);
//   });
// }

// class MockUser extends Mock implements User {}
//
 MockUser? mockUser = MockUser(
   email: 'some@email.com',
 );

class MockAuth extends Mock implements MockFirebaseAuth {
  @override
  Stream<User> authStateChanges() {
    return Stream.fromIterable([
      MockUser(),
    ]);
  }
}

// final tUser = MockUser(
//   isAnonymous: false,
//   uid: 'T3STU1D',
//   email: 'bob@thebuilder.com',
//   displayName: 'Bob Builder',
//   phoneNumber: '0800 I CAN FIX IT',
//   photoURL: 'http://photos.url/bobbie.jpg',
//   refreshToken: 'some_long_token',
// );

// class LoginTest{
//   final FirebaseAuth? auth;
//
//   LoginTest({this.auth});
//
//   Stream<User?> get user => auth!.authStateChanges();
//
//   Future<String> createAccount({required String email, required String password})
//   async {
//
//
// }
// }

Future<void> main() async {
  late MockFirebaseAuth mockAuth;
  late Auth auth;
  // MockUser user = MockUser(
  //   isAnonymous: false,
  //   uid: 'someuid',
  //   email: 'bob@somedomain.com',
  //   displayName: 'Bob',
  // );
  final googleSignIn = MockGoogleSignIn();
  final signinAccount = await googleSignIn.signIn();
  final googleAuth = await signinAccount!.authentication;
  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  // final result = await auth.signInWithCredential(credential);
  // final user = await result.user;

  setUp(() async {
    // user = MockUser(
    //   isAnonymous: false,
    //   uid: 'someuid',
    //   email: 'bob@somedomain.com',
    //   displayName: 'Bob',
    // );
    mockAuth = MockFirebaseAuth();

    // WidgetsFlutterBinding.ensureInitialized();
    // await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );
    // mockAuth = MockAuth();
    // auth = Auth(auth: mockAuth);
  });
  tearDown(() {});

  // test("emit occurs", () async {
  //   expectLater(auth.currentUser(), emitsInOrder({_mockUser}));
  // });

  // test("create account", () async {
  //   when(
  //       await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //         // name: nameController.text.trim(),
  //           email: "xyz@gmail.com",
  //           password: "qwerty12"));
  //
  //   expect(
  //       await auth.createUser("xyz@gmail.com", "qwerty12"),
  //       "Success");
  // });
  //
  // test("create account exception", () async {
  //   when(
  //     mockAuth.createUserWithEmailAndPassword(
  //       email: "xyz@gmail.com", password: "qwerty12",),
  //   ).thenAnswer((realInvocation) => throw FirebaseAuthException(code: "Failed"));
  //
  //   expect(
  //       await auth.createUser("xyz@gmail.com", "qwerty12"),
  //       "Failed");
  // });

  test('sign into account', () async {
    // final googleSignIn = MockGoogleSignIn();
    // final signinAccount = await googleSignIn.signIn();
    // final googleAuth = await signinAccount!.authentication;
    // final AuthCredential credential = GoogleAuthProvider.credential(
    //   accessToken: googleAuth.accessToken,
    //   idToken: googleAuth.idToken,
    // );
    // // Sign in.
    // // final user = MockUser(
    // //   isAnonymous: false,
    // //   uid: 'someuid',
    // //   email: 'bob@somedomain.com',
    // //   displayName: 'Bob',
    // // );
    // final auth = MockFirebaseAuth();
    // final result = await auth.signInWithCredential(credential);
    // final User = result.user;
    // print(User?.displayName);

    // final email = 'some@email.com';
    // final password = 'some!password';
    final auth = MockFirebaseAuth(mockUser: mockUser);
    final result = await auth.signInWithEmailAndPassword(
        email: mockUser!.email!, password: "password");
    final user = result.user!;
    print(user.refreshToken);
    print(user.uid);
    print(user.email);
    // expect(user.email, "_test_${user.uid}@example.test");
    expect(user.email , mockUser!.email);
        // , "_test_${user.uid}@example.test");
    // expect(auth.authStateChanges(), emitsInOrder([null, isA<User>()]));
    // expect(auth.userChanges(), emitsInOrder([null, isA<User>()]));

    // expect(user.isAnonymous, isFalse);

    // when(await mockAuth.signInWithEmailAndPassword(
    //     email: "xyz@gmail.com",
    //     password: "qwerty12"));

    // expect(result.user!.email, "xyz@gmail.com");
  });

  test('Returns no user if not signed in', () async {
    final auth = MockFirebaseAuth();
    final user = auth.currentUser;
    expect(user, isNull);
  });

  test('Returns user if signed in', () async {
    final auth = MockFirebaseAuth(signedIn: true);
    expect(auth.authStateChanges(), emitsInOrder([isA<User>()]));
    expect(auth.userChanges(), emitsInOrder([isA<User>()]));
    print('Signed In');
  });

  // test('with email and password', () async {
  //   final auth = MockFirebaseAuth();
  //   final result = await auth.signInWithEmailAndPassword(
  //       email: 'some email', password: 'some password');
  //   final user = result.user;
  //   print(user);
  //   expect(user, isNotNull);
  //   // expect(user!.email, 'some email');
  //   // expect(auth.authStateChanges(), emitsInOrder([null, isA<User>()]));
  //   // expect(auth.userChanges(), emitsInOrder([null, isA<User>()]));
  // });

  group('Returns a mocked user after sign up', () {
    test('With email and password', () async {
      final email = 'some@email.com';
      final password = 'some!password';
      final auth = MockFirebaseAuth();
      final result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final user = result.user!;
      print(user.refreshToken);
      expect(user.email, email);
      expect(auth.authStateChanges(), emitsInOrder([null, isA<User>()]));
      expect(auth.userChanges(), emitsInOrder([null, isA<User>()]));
      expect(user.isAnonymous, isFalse);
      print(user.email);
    });

    // test('With already used email and password', () async{
    //   final email = 'some@email.com';
    //   final password = 'some!password';
    //   final auth = MockFirebaseAuth();
    //   final result = await auth.createUserWithEmailAndPassword(
    //       email: email, password: password);
    //   final user = result.user!;
    //   print(user.refreshToken);
    //   expect(user.email, email);
    //   expect(auth.authStateChanges(), emitsInOrder([null, isA<User>()]));
    //   expect(auth.userChanges(), emitsInOrder([null, isA<User>()]));
    //   expect(user.isAnonymous, isFalse);
    // });
  });

  test('Returns null after sign out', () async{
    final auth = MockFirebaseAuth(signedIn: true, mockUser: mockUser);
    final user = auth.currentUser;

    await auth.signOut();

    expect(auth.currentUser, isNull);
    expect(auth.authStateChanges(), emitsInOrder([user, null]));
    expect(auth.userChanges(), emitsInOrder([user, null]));
  });

  test('sendPasswordResetMail works', () async {
    final auth = MockFirebaseAuth();

    expect(
            () async => await auth.sendPasswordResetEmail(email: ''),
    returnsNormally,);
  });

  // test("sign in exception", () async {
  //   when(
  //     mockAuth.signInWithEmailAndPassword(
  //       email: "xyz@gmail.com",
  //       password: "qwerty12",
  //     ),
  //   ).thenAnswer(
  //       (realInvocation) => throw FirebaseAuthException(code: "Failed"));
  //
  //   expect(await auth.signIn("xyz@gmail.com", "qwerty12"), "Failed");
  // });

  // test("sign out of account", () async {
  //   when(
  //     mockAuth.signOut(),
  //   ).thenAnswer((realInvocation) => null);
  //
  //   expect(
  //       await auth.signOut(),
  //       "Success");
  // });
}

// main() async {
//   // Mock sign in with Google.
//   final googleSignIn = MockGoogleSignIn();
//   final signinAccount = await googleSignIn.signIn();
//   final googleAuth = await signinAccount!.authentication;
//   final AuthCredential credential = GoogleAuthProvider.credential(
//     accessToken: googleAuth.accessToken,
//     idToken: googleAuth.idToken,
//   );
//   // Sign in.
//   final user = MockUser(
//     isAnonymous: false,
//     uid: 'someuid',
//     email: 'bob@somedomain.com',
//     displayName: 'Bob',
//   );
//   final auth = MockFirebaseAuth(mockUser: user);
//   final result = await auth.signInWithCredential(credential);
//   final User = result.user;
//   print(User?.displayName);
// }