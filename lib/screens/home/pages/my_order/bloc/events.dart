part of'bloc.dart';
class OrderEvents{}

class GetCurrentOrderEvent extends OrderEvents{}
class GetFinishedOrderEvent extends OrderEvents{}
class RefreshCurrentOrderEvent extends OrderEvents{}
class LoadingCurrentOrderEvent extends OrderEvents{}
class RefreshFinishedOrderEvent extends OrderEvents{}
class LoadingFinishedOrderEvent extends OrderEvents{}
