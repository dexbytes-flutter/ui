import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/image_res/iconApp.dart';
import 'package:flutter/material.dart';

class BookmarkButton extends StatefulWidget {
  final double _iconSize;
  final Color _iconColor;
  final bool _isFavorite;
  final Function _valueChanged;
  final Color? _iconDisabledColor;

  BookmarkButton({
    double? iconSize,
    Color? iconColor,
    Color? iconDisabledColor,
    bool? isFavorite,
    required Function valueChanged,
    Key? key,
  })  : _iconSize = iconSize ?? 25.0,
        _iconColor = iconColor ?? Color(0xFFD6A266),
        _iconDisabledColor = iconDisabledColor ?? appColors.appBgColorLeanWhite.withOpacity(0.40),
        _isFavorite = isFavorite ?? false,
        _valueChanged = valueChanged,
        super(key: key);

  @override
  _BookmarkButtonState createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<BookmarkButton>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _sizeAnimation;

  late CurvedAnimation _curve;

  double _maxIconSize = 0.0;
  double _minIconSize = 0.0;

  final int _animationTime = 500;

  bool _isFavorite = false;
  bool _isAnimationCompleted = false;

  @override
  void initState() {
    super.initState();

    _isFavorite = widget._isFavorite;
    _maxIconSize = (widget._iconSize < 20.0)
        ? 20.0
        : (widget._iconSize > 100.0)
        ? 20.0
        : widget._iconSize;
    final double _sizeDifference = _maxIconSize * 0.10;
    _minIconSize = _maxIconSize - _sizeDifference;

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: _animationTime),
    );

    _curve = CurvedAnimation(curve: Curves.ease, parent: _controller);
    Animation<Color?> _selectedColorAnimation = ColorTween(
      begin: widget._iconColor,
      end: widget._iconDisabledColor,
    ).animate(_curve);

    Animation<Color?> _deSelectedColorAnimation = ColorTween(
      begin: widget._iconDisabledColor,
      end: widget._iconColor,
    ).animate(_curve);

    _colorAnimation = (_isFavorite == true)
        ? _selectedColorAnimation
        : _deSelectedColorAnimation;
    _sizeAnimation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: _minIconSize,
            end: _maxIconSize,
          ),
          weight: 5,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: _maxIconSize,
            end: _minIconSize,
          ),
          weight: 5,
        ),
      ],
    ).animate(_curve);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _isAnimationCompleted = true;
        _isFavorite = !_isFavorite;
        widget._valueChanged(_isFavorite);
      } else if (status == AnimationStatus.dismissed) {
        _isAnimationCompleted = false;
        _isFavorite = !_isFavorite;
        widget._valueChanged(_isFavorite);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, _) {
        return InkResponse(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            setState(() {
              if (_isAnimationCompleted == true) {
                _controller.reverse();
              } else {
                _controller.forward();
              }
            });
          },
          child: iconApps.iconImage(
              imageUrl: iconApps.bookmarkIconFilled,
              iconSize: Size(_sizeAnimation.value, _sizeAnimation.value),
              imageColor: _colorAnimation.value
          )

          /*Icon(
            (Icons.favorite),
            color: _colorAnimation.value,
            size: _sizeAnimation.value,
          )*/,
        );
      },
    );
  }
}