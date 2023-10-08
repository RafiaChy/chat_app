import 'package:chat_app/app_configurations/app_environments.dart';
import 'package:chat_app/main.dart';

void main(){
  AppEnvironments.setUpEnvironments(Environments.prod);
  mainDelegateForEnvironments();
}