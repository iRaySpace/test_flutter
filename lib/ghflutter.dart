import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'strings.dart';
import 'member.dart';

class GHFlutterState extends State<GHFlutter> {
  var _members = <Member>[];

  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  void initState() {
    super.initState();
    this._loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text(Strings.appTitle),
      ),
      body: ListView.builder(
        itemCount: _members.length * 2,
        itemBuilder: this._rowBuilder,      
      ),
    );
  }

  Widget _rowBuilder(BuildContext context, int position) {
    if (position.isOdd) return Divider();
    final index = position ~/2;
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: ListTile(
        title: Text("${_members[index].login}", style: _biggerFont),
        leading: CircleAvatar(
          backgroundColor: Colors.green,
          backgroundImage: NetworkImage(_members[index].avatarUrl),
        ),
      ),
    );
  }

  void _loadData() async {
    http.Response response = await http.get("https://api.github.com/orgs/raywenderlich/members");
    setState(() {
      final membersJSON = json.decode(response.body);
      for (var memberJSON in membersJSON) {
        final member = Member(memberJSON["login"], memberJSON["avatar_url"]);
        _members.add(member);
      }
    });
  }

}

class GHFlutter extends StatefulWidget {
  @override
  createState() => GHFlutterState();
}
