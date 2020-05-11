import 'package:flutter/material.dart';
import 'package:token_system/Entities/user.dart';
import 'package:token_system/components/tab_navigator.dart';
import 'package:token_system/screens/user_profile/check.dart';

enum UserOptions { logout, editProfile }

class BookScreen extends StatelessWidget {
  final User user;
  final GlobalKey<TabNavigatorState> tn;

  BookScreen({Key key, @required this.user, @required this.tn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Update TabNavigator with the context and the next update screen
    tn.currentState.updateScreen(DestinationView());

    return Column(children: <Widget>[
      Container(
        alignment: Alignment.topRight,
        child: PopupMenuButton<UserOptions>(
            onSelected: (UserOptions result) {
              if (result == UserOptions.logout) {
                Navigator.pushReplacementNamed(context, '/login');
              }
              if (result == UserOptions.editProfile) {
                // TODO: Navigate to Edit Profile screen
                // Navigator.push(context, '/edit')
              }
            },
            itemBuilder: (BuildContext context) =>
                <PopupMenuEntry<UserOptions>>[
                  const PopupMenuItem<UserOptions>(
                    value: UserOptions.editProfile,
                    child: Text('Edit Profile'),
                  ),
                  const PopupMenuItem<UserOptions>(
                    value: UserOptions.logout,
                    child: Text('Logout'),
                  ),
                ]),
      ),
      Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Column(children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            child: Icon(
              Icons.blur_circular,
              size: 100,
            ),
          ),
        ]),
      ),
      RaisedButton(
        child: Text(
          'PUSH',
          style: TextStyle(fontSize: 32.0, color: Colors.orange),
        ),
        onPressed: () {
          tn.currentState.push(context);
        },
      )
    ]);
  }
}
