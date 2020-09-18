import 'package:oxkart/blocs/auth_bloc.dart';

class BlocProvider {
  final _bloc = AuthBloc();
  AuthBloc get bloc => _bloc;
}
