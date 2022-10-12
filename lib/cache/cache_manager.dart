import 'dart:io';
import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class MSCacheManager {
  static const ftMatchEventList = 'footballMatchEventList';
  static const ftMatchEventListLastTime = 'footballMatchEventListLastTime';
  static const ftTeamList = 'footballTeamList';
  static const ftTeamListLastTime = 'footballTeamListLastTime';
  static const ftMatchList = 'footballMatchList';
  static const ftMatchListLastTime = 'footballMatchListLastTime';

  static Future<File> getFile(String fileName) async {
    // 获取应用文件目录
    final fileDir = await getApplicationDocumentsDirectory();
    // 获取存储路径
    final filePath = fileDir.path;

    return File(filePath + '/' + fileName);
  }

  // 存储数据
  static saveData(String url, dynamic data) async {
    final file = await MSCacheManager.getFile(url);
    final str = convert.jsonEncode(data);
    file.writeAsString(str);
    debugPrint('存储' + url + '成功');
  }

  // 读取数据
  static dynamic getData(String url) async {
    final file = await MSCacheManager.getFile(url);
    bool isExists = await file.exists();
    if (!isExists) return Null;
    final str = await file.readAsString();
    if (str.isEmpty) return Null;
    final obj = convert.jsonDecode(str);
    return obj;
  }
}
