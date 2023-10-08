import 'app_configurations/app_environments.dart';
import 'main.dart';

void main(){
  AppEnvironments.setUpEnvironments(Environments.dev);

  mainDelegateForEnvironments();
}