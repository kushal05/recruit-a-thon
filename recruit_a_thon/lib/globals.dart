import 'Models/User.dart';

User currentUser;
bool isUserLoggedIn = false;
bool isCandidate;

List<User> users = [];

var userMapping = new Map();

String enteredEmail = "";
String enteredPassword = "";