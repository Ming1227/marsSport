import 'dart:convert';
import 'dart:typed_data';

// import 'package:flutter/material.dart';

// 将数字转换成大写字母
String transIntToChar(int num) {
  // 如果数字不在范围返回 -
  if (num > 26 || num < 0) return '-';
  var list = [num - 1 + 97];
  final u8List = Uint8List.fromList(list);
  final char = const Utf8Codec().decode(u8List).toUpperCase();
  // debugPrint('转换前:' + num.toString() + ',后:' + char);
  return char;
}
