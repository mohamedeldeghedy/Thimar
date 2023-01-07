part of'bloc.dart';
class NotificationStates{}

class NotificationInitialState extends NotificationStates{}

class NotificationLoadingState extends NotificationStates{

}
class NotificationSuccessState extends NotificationStates{
  String msg;
  NotificationSuccessState({required this.msg});
}
class NotificationFailedState extends NotificationStates{}
