import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

abstract class BaseState<
  TWidget extends StatefulWidget,
  TController extends Object
>
    extends State<TWidget> {
  late final TController controller = GetIt.I<TController>();
}
