import 'package:internet_connection_checker/internet_connection_checker.dart';

class Connection {
  Stream<InternetConnectionStatus> checkConnection() =>
      InternetConnectionChecker().onStatusChange;
}
