part of'bloc.dart';
class RegisterEvents{}

class PostRegisterEvent extends RegisterEvents{
 final String id;
 PostRegisterEvent({required this.id});
}
class GetCityEvent extends RegisterEvents{}