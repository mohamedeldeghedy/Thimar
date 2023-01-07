import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar/edit_pass/bloc/bloc.dart';
import 'package:thimar/shared/my_button.dart';
import 'package:thimar/shared/show_toast.dart';

import '../core/input_validators.dart';
import '../shared/input.dart';
import '../shared/my_app_bar.dart';

class EditPasswordScreen extends StatefulWidget {
  const EditPasswordScreen({Key? key}) : super(key: key);

  @override
  State<EditPasswordScreen> createState() => _EditPasswordScreenState();
}

class _EditPasswordScreenState extends State<EditPasswordScreen> {
  final bloc=KiwiContainer().resolve<EditPasswordBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'تعديل كلمة المرور'),
      body: Form(
        key: bloc.formKey,
        child: Column(children: [
          Input(
            label: 'كلمة المرور الحالية',
            controller: bloc.oldPasswordController,
            validate: validatePassword,
          ),
          Input(
            hint: 'كلمة المرور الجديدة',
            controller: bloc.newPasswordController,
            validate: validatePassword
          ),
          BlocConsumer(
            listener:(context, state) {
              if(state is EditPasswordSuccessState)
              {
                showToast(msg: state.msg, state: ToastStates.success);

              }
              if(state is EditPasswordFailedState){
                showToast(msg: state.msg, state: ToastStates.error);

              }
            } ,
            bloc:bloc ,
            builder:(context, state) {
              return MyButton(
                  buttonName: 'تغيير',
                  isLoading: state is EditPasswordLoadingState,
                  onPressed: ()
                  {
                    if(bloc.formKey.currentState!.validate()){
                      bloc.add(EditPasswordEvent());
                    }
                  }
              );

            } ,

          )
        ]),
      ),
    );
  }
}
