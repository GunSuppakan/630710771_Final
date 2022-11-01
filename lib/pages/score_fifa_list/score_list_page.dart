import 'dart:convert';

import 'package:final_flutter/model/ApiResult.dart';
import 'package:final_flutter/model/score_item.dart';
import 'package:final_flutter/service/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const apiBaseUrl = 'http://103.74.252.66:8888';

class Score_Fifa extends StatefulWidget {
  const Score_Fifa({Key? key}) : super(key: key);

  @override
  State<Score_Fifa> createState() => _Score_FifaState();
}

class _Score_FifaState extends State<Score_Fifa> {
  List<TeamItem>? _teamList;


  @override
  void initState() {
    super.initState();
    //_handleClickButton();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Stack(
            children: [
              if (_teamList != null)
                ListView.builder(
                  itemBuilder: _buildListItem,


                ),
            ],
          )),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _handleClickButton,
              child: const Text('View Result'),
            ),
          ),

        ],
      ),
    );
  }

  void _handleClickButton() async{
    var response =  http.get(Uri.parse(apiBaseUrl));
    var output = jsonDecode(response.body);
    var apiResult = ApiResult.fromJson(output);
    setState(() {
      _teamList = apiResult.data.map<TeamItem>((item) {
        return TeamItem.fromJson(item);
      }).toList();
    });

    _teamList = [];
    _teamList = output['data'].map<TeamItem>((item){
      return TeamItem.fromJson(item);
    }).toList();
    output['data'].forEach()
  }

  Widget _buildListItem(BuildContext context, int index) {
    var teamItem = _teamList![index];
    return Card(
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            Image.network(teamItem.image,),
            Text(teamItem.name),
            Text(teamItem.group)
          ],
        ),
      ),
    );
  }





}
