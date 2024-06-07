import 'package:flutter/material.dart';
import 'package:moniepoint_flutter_task/screens/home/widgets/offer_item.dart';
import 'package:moniepoint_flutter_task/theme/colors.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  bool _animateLocation = false;
  bool _animateAvatar = false;
  bool _animateName = false;
  bool _animateLine1 = false;
  bool _animateLine2 = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(milliseconds: 300));
      setState(() {
        _animateAvatar = true;
      });
      await Future.delayed(const Duration(milliseconds: 600));
      setState(() {
        _animateLocation = true;
      });
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
        await Future.delayed(const Duration(milliseconds: 800));
        setState(() {
          _animateName = true;
        });
        await Future.delayed(const Duration(milliseconds: 1000));
        setState(() {
          _animateLine1 = true;
        });
        await Future.delayed(const Duration(milliseconds: 200));
        setState(() {
          _animateLine2 = true;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18, top: 10),
      child: Column(
        children: [
          SafeArea(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: _animateLocation ? 1 : 0,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 4),
                        child: Icon(
                          Icons.location_on,
                          color: colorScheme.secondary,
                        ),
                      ),
                      Text(
                        'Saint Petersburg',
                        style: TextStyle(
                            color: colorScheme.secondary, fontSize: 16),
                      ),
                    ],
                  )),
              AnimatedScale(
                duration: const Duration(milliseconds: 500),
                scale: _animateAvatar ? 1 : 0,
                child: Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: const [0.1, 0.6],
                      colors: [
                        colorScheme.tertiary,
                        colorScheme.primary,
                      ],
                    ),
                  ),
                  child: Image.asset('assets/images/avatar.png'),
                ),
              ),
            ],
          )),
          Align(
            alignment: Alignment.topLeft,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: _animateName ? 1 : 0,
              child: Text(
                'Hi, Marina',
                style: TextStyle(
                  color: colorScheme.secondary,
                ),
              ),
            ),
          ),
          ClipRRect(
            child: Align(
              alignment: Alignment.topLeft,
              child: AnimatedSlide(
                duration: const Duration(milliseconds: 500),
                offset: _animateLine1 ? Offset.zero : const Offset(0, 1),
                child: Text(
                  "let's select your",
                  style: TextStyle(
                    fontSize: 36,
                    color: colorScheme.surface,
                  ),
                ),
              ),
            ),
          ),
          ClipRRect(
            child: Align(
              alignment: Alignment.topLeft,
              child: AnimatedSlide(
                duration: const Duration(milliseconds: 500),
                offset: _animateLine2 ? Offset.zero : const Offset(0, 1),
                child: Text(
                  'perfect place',
                  style: TextStyle(
                    fontSize: 36,
                    color: colorScheme.surface,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 36),
          Row(
            children: [
              const Expanded(
                child: OfferItem(
                  title: 'BUY',
                  count: 1034,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: OfferItem(
                  title: 'RENT',
                  count: 2212,
                  color: colorScheme.onPrimary,
                  textColor: colorScheme.secondary,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
