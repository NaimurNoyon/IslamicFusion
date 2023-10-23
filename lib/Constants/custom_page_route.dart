import 'package:flutter/material.dart';

class CustomPageRouteBottomToTop<T> extends PageRoute<T> {
  CustomPageRouteBottomToTop({
    required this.builder,
    this.transitionDuration = const Duration(milliseconds: 500),
  });

  final WidgetBuilder builder;

  @override
  final Duration transitionDuration;

  @override
  final bool opaque = true;

  @override
  final bool barrierDismissible = false;

  @override
  final bool maintainState = true;

  // Add concrete implementations for the missing getters
  @override
  Color? get barrierColor => null; // You can provide a color if needed

  @override
  String get barrierLabel => ''; // Provide a label if needed

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return builder(context);
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    const begin = Offset(0.0, 1.0);
    const end = Offset.zero;
    const curve = Curves.easeInOut;
    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    var offsetAnimation = animation.drive(tween);
    return SlideTransition(position: offsetAnimation, child: child);
  }
}

class CustomPageRouteRightToLeft<T> extends PageRoute<T> {
  CustomPageRouteRightToLeft({
    required this.builder,
    this.transitionDuration = const Duration(milliseconds: 500),
  });

  final WidgetBuilder builder;

  @override
  final Duration transitionDuration;

  @override
  final bool opaque = true;

  @override
  final bool barrierDismissible = false;

  @override
  final bool maintainState = true;

  // Add concrete implementations for the missing getters
  @override
  Color? get barrierColor => null; // You can provide a color if needed

  @override
  String get barrierLabel => ''; // Provide a label if needed

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return builder(context);
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    const begin = Offset(1.0, 0.0);
    const end = Offset.zero;
    const curve = Curves.easeInOut;
    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    var offsetAnimation = animation.drive(tween);
    return SlideTransition(position: offsetAnimation, child: child);
  }
}

class CustomPageRouteLeftToRight<T> extends PageRoute<T> {
  CustomPageRouteLeftToRight({
    required this.builder,
    this.transitionDuration = const Duration(milliseconds: 500),
  });

  final WidgetBuilder builder;

  @override
  final Duration transitionDuration;

  @override
  final bool opaque = true;

  @override
  final bool barrierDismissible = false;

  @override
  final bool maintainState = true;

  // Add concrete implementations for the missing getters
  @override
  Color? get barrierColor => null; // You can provide a color if needed

  @override
  String get barrierLabel => ''; // Provide a label if needed

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return builder(context);
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    const begin = Offset(-1.0, 0.0); // Changed the begin offset
    const end = Offset.zero;
    const curve = Curves.easeInOut;
    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve)); // Reversed the begin and end offsets
    var offsetAnimation = animation.drive(tween);
    return SlideTransition(position: offsetAnimation, child: child);
  }
}