part of'bloc.dart';
class OrderStates{}

class OrderInitialState extends OrderStates{}

class GetCurrentOrderLoadingState extends OrderStates{}
class GetCurrentOrderSuccessState extends OrderStates{}
class GetCurrentOrderFailedState extends OrderStates{}

class GetFinishedOrderLoadingState extends OrderStates{}
class GetFinishedOrderSuccessState extends OrderStates{}
class GetFinishedOrderFailedState extends OrderStates{}

class RefreshCurrentOrderState extends OrderStates{}
class LoadingCurrentOrderState extends OrderStates{}

class RefreshFinishedOrderState extends OrderStates{}
class LoadingFinishedOrderState extends OrderStates{}