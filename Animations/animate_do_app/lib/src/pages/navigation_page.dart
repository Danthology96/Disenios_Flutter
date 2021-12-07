import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: const Text('Notifications Page'),
        ),
        floatingActionButton: const CustomFloatingButton(),
        bottomNavigationBar: const CustomBottomNavigationBar(),
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int notificationsNumber =
        Provider.of<_NotificationModel>(context).numero;

    return BottomNavigationBar(
      items: [
        const BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.bone), label: 'Bones'),
        BottomNavigationBarItem(
            icon: Stack(
              children: [
                const FaIcon(FontAwesomeIcons.bell),
                Positioned(
                  right: 0,
                  top: 0,
                  child: BounceInDown(
                    from: 10,
                    animate: (notificationsNumber > 0) ? true : false,
                    child: Bounce(
                      from: 10,
                      controller: (p0) =>
                          Provider.of<_NotificationModel>(context)
                              .bounceController = p0,
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                            color: Colors.pink, shape: BoxShape.circle),
                        child: Text('$notificationsNumber',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 8)),
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            label: 'Notifications'),
        const BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.dog), label: 'My dog'),
      ],
      currentIndex: 0,
      selectedItemColor: Colors.pink,
    );
  }
}

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: const Icon(
          Icons.play_arrow,
        ),
        backgroundColor: Colors.pink,
        onPressed: () {
          int notificationsNumber =
              Provider.of<_NotificationModel>(context, listen: false).numero;
          notificationsNumber++;
          Provider.of<_NotificationModel>(context, listen: false).numero =
              notificationsNumber;

          if (notificationsNumber >= 2) {
            final controller =
                Provider.of<_NotificationModel>(context, listen: false)
                    .bounceController;
            controller.forward(from: 0.0);
          }
        });
  }
}

class _NotificationModel extends ChangeNotifier {
  int _numero = 0;
  late AnimationController bounceController;

  int get numero => _numero;

  set numero(int value) {
    _numero = value;
    notifyListeners();
  }
}
