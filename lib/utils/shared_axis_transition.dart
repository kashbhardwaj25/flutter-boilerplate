import 'package:flutter/material.dart';

class CustomSharedAxisPageTransitionsBuilder extends PageTransitionsBuilder {
  const CustomSharedAxisPageTransitionsBuilder({
    this.fillColor,
  });

  final Color? fillColor;

  @override
  Widget buildTransitions<T>(
    PageRoute<T>? route,
    BuildContext? context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return CustomSharedAxisTransition(
      animation: animation,
      secondaryAnimation: secondaryAnimation,
      fillColor: fillColor,
      child: child,
    );
  }
}

class CustomSharedAxisTransition extends StatelessWidget {
  const CustomSharedAxisTransition({
    Key? key,
    required this.animation,
    required this.secondaryAnimation,
    this.fillColor,
    this.child,
  }) : super(key: key);

  final Animation<double> animation;
  final Animation<double> secondaryAnimation;
  final Color? fillColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final Color color = fillColor ?? Theme.of(context).canvasColor;
    return DualTransitionBuilder(
      animation: animation,
      forwardBuilder: (
        BuildContext context,
        Animation<double> animation,
        Widget? child,
      ) {
        return _EnterTransition(
          animation: animation,
          child: child,
        );
      },
      reverseBuilder: (
        BuildContext context,
        Animation<double> animation,
        Widget? child,
      ) {
        return _ExitTransition(
          animation: animation,
          reverse: true,
          fillColor: color,
          child: child,
        );
      },
      child: child,
    );
  }
}

class _EnterTransition extends StatelessWidget {
  const _EnterTransition({
    required this.animation,
    this.reverse = false,
    this.child,
  });

  final Animation<double> animation;
  final Widget? child;
  final bool reverse;

  static final Animatable<double> _fadeInTransition = CurveTween(
    curve: decelerateEasing,
  ).chain(CurveTween(curve: const Interval(0.3, 1.0)));

  static final Animatable<double> _scaleDownTransition = Tween<double>(
    begin: 1.10,
    end: 1.00,
  ).chain(CurveTween(curve: standardEasing));

  static final Animatable<double> _scaleUpTransition = Tween<double>(
    begin: 0.80,
    end: 1.00,
  ).chain(CurveTween(curve: standardEasing));

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeInTransition.animate(animation),
      child: ScaleTransition(
        scale: (!reverse ? _scaleUpTransition : _scaleDownTransition)
            .animate(animation),
        child: child,
      ),
    );
  }
}

class _ExitTransition extends StatelessWidget {
  const _ExitTransition({
    required this.animation,
    this.reverse = false,
    required this.fillColor,
    this.child,
  });

  final Animation<double> animation;
  final bool reverse;
  final Color fillColor;
  final Widget? child;

  static final Animatable<double> _fadeOutTransition = _FlippedCurveTween(
    curve: accelerateEasing,
  ).chain(CurveTween(curve: const Interval(0.0, 0.3)));

  static final Animatable<double> _scaleUpTransition = Tween<double>(
    begin: 1.00,
    end: 1.10,
  ).chain(CurveTween(curve: standardEasing));

  static final Animatable<double> _scaleDownTransition = Tween<double>(
    begin: 1.00,
    end: 0.80,
  ).chain(CurveTween(curve: standardEasing));

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeOutTransition.animate(animation),
      child: Container(
        color: fillColor,
        child: ScaleTransition(
          scale: (!reverse ? _scaleUpTransition : _scaleDownTransition)
              .animate(animation),
          child: child,
        ),
      ),
    );
  }
}

class _FlippedCurveTween extends CurveTween {
  _FlippedCurveTween({
    required Curve curve,
  }) : super(curve: curve);

  @override
  double transform(double t) => 1.0 - super.transform(t);
}
