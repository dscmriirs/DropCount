import 'package:awesome_dropdown/awesome_dropdown.dart';
import 'package:dropcount/screens/AboutPage.dart';
import 'package:dropcount/screens/Settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DropDownWithPanDownAndDrawer extends StatefulWidget {
  const DropDownWithPanDownAndDrawer({Key? key}): super(key: key);
  @override
  _DropDownWithPanDownAndDrawerState createState() =>
      _DropDownWithPanDownAndDrawerState();
}

class _DropDownWithPanDownAndDrawerState
    extends State<DropDownWithPanDownAndDrawer> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isBackPressedOrTouchedOutSide = false,
      _isDropDownOpened = false,
      _isPanDown = false;
  late List<String> _list;
  String _selectedItem = '';

  @override
  void initState() {
    _list = ["Settings()",  "AboutPage()"];
    _selectedItem = 'Select Item';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// we need to wrap our Scaffold in GestureDetector in order to get required functionalities
    ///  i.e. close the dropdown on drawer click and touch on outside
    return GestureDetector(
      onTap: _removeFocus,
      onPanDown: (focus) {
        _isPanDown = true;
        _removeFocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        key: _scaffoldKey,

        /// I have maintain open and close state of drop down with the drawer
        /// if drop down is opened and user wants to open Drawer, it will first close the drop down then open the drawer
        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                child: Text('Drawer Header'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Settings'),
                onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Settings()),
                    );}
              ),
              ListTile(
                title: Text('About Us'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutPage()),
                  );
                },
              ),
            ],
          ),
        ),
        appBar: PreferredSize(
          preferredSize: AppBar().preferredSize,
          child: SafeArea(
            child: PreferredSize(
                preferredSize: Size.fromHeight(100.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 60),
                      child: const Text('Awesome DropDown',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold)),
                    ),
                    Container(
                        margin: EdgeInsets.only(right: 8),
                        child: IconButton(
                            icon: const Icon(
                              Icons.menu,
                              size: 30,
                              color: Colors.blueAccent,
                            ),
                            onPressed: () {
                              _onDrawerBtnPressed();
                            } //_onDrawerBtnPressed
                        ))
                  ],
                )),
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(top: 15, left: 16, right: 20),
          child: AwesomeDropDown(
            isPanDown: _isPanDown,
            dropDownList: _list,
            isBackPressedOrTouchedOutSide: _isBackPressedOrTouchedOutSide,
            selectedItem: _selectedItem,
            onDropDownItemClick: (selectedItem) {
              _selectedItem = selectedItem;
            },
            dropStateChanged: (isOpened) {
              _isDropDownOpened = isOpened;
              if (!isOpened) {
                _isBackPressedOrTouchedOutSide = false;
              }
            },
          ),
        ),
      ),
    );
  }

  /// this func is used to close dropDown (if open) when you tap or pandown anywhere in the screen
  void _removeFocus() {
    if (_isDropDownOpened) {
      setState(() {
        _isBackPressedOrTouchedOutSide = true;
      });
    }
  }

  /// this func will call on DrawerIconPressed, it closes the dropDown if open and then open the drawer
  void _onDrawerBtnPressed() {
    if (_isDropDownOpened) {
      setState(() {
        _isBackPressedOrTouchedOutSide = true;
      });
    } else {
      _scaffoldKey.currentState!.openEndDrawer();
      FocusScope.of(context).requestFocus(FocusNode());
    }
  }
}