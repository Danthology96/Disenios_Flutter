import 'package:backgrounds/src/routes/routes.dart';
import 'package:backgrounds/src/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LauncherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diseños en flutter'),
      ),
      body: _OptionsList(),
      drawer: _MainMenu(),
    );
  }
}

class _MainMenu extends StatelessWidget {
  const _MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.colorScheme.secondary;
    return Drawer(
      child: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                height: 160,
                child: CircleAvatar(
                  backgroundColor: accentColor,
                  child: Text(
                    'DN',
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ),
              Expanded(
                child: _OptionsList(),
              ),
              ListTile(
                leading: Icon(Icons.lightbulb_outline, color: accentColor),
                title: Text('Dark mode'),
                trailing: Switch.adaptive(
                  value: appTheme.darkTheme,
                  onChanged: (value) => appTheme.darkTheme = value,
                  activeColor: accentColor,
                ),
              ),
              SafeArea(
                bottom: true,
                top: false,
                left: false,
                right: false,
                child: ListTile(
                  leading: Icon(Icons.add_to_home_screen, color: accentColor),
                  title: Text('Dark mode'),
                  trailing: Switch.adaptive(
                    value: appTheme.customTheme,
                    onChanged: (value) => appTheme.customTheme = value,
                    activeColor: accentColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OptionsList extends StatelessWidget {
  const _OptionsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, i) => ListTile(
        leading:
            FaIcon(pageRoutes[i].icon, color: appTheme.colorScheme.secondary),
        title: Text(pageRoutes[i].title),
        trailing: FaIcon(FontAwesomeIcons.chevronRight,
            color: appTheme.colorScheme.secondary),
        onTap: () {
          Navigator.push(context,
              CupertinoPageRoute(builder: (context) => pageRoutes[i].page));
        },
      ),
      separatorBuilder: (context, i) => Divider(
        color: appTheme.primaryColorLight,
      ),
      itemCount: pageRoutes.length,
    );
  }
}
