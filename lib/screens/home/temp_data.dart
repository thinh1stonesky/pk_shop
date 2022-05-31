

import 'dart:math';

import 'package:flutter/material.dart';

class LoaiPK{
  int id;
  String content;
  Color color;
  LoaiPK({required this.id, required this.content, required this.color});
}

class SanPham{
  int? id;
  String name;
  String urlName;
  int? loaiId;
  SanPham({
    required this.urlName,
    required this.name,
    this.loaiId}){
    id = Random().nextInt(1000);
  }
}


List<LoaiPK> LoaiPKs = [
  LoaiPK(id: 1, content: 'Tai Nghe', color: Colors.deepOrange),
  LoaiPK(id: 2, content: 'Sạc dự phòng', color: Colors.teal),
  LoaiPK(id: 3, content: 'Giá đỡ', color: Colors.red),
  LoaiPK(id: 4, content: 'Cường lực', color: Colors.amber),
  LoaiPK(id: 5, content: 'Yoghurt', color: Colors.deepPurpleAccent),
];

List<SanPham> sanphams = [
  SanPham(
      urlName: 'https://image.cellphones.com.vn/358x/media/catalog/product/a/z/azaudio-tai-nghe-bluetooth-apple-airpod-2_2.jpg',
      name: 'Sushi - 寿司',
      loaiId: 1),
  SanPham(
      urlName: 'https://image.cellphones.com.vn/358x/media/catalog/product/a/z/azaudio-tai-nghe-bluetooth-apple-airpod-2_2.jpg',
      name: 'Sushi - 寿司',
      loaiId: 1),
  SanPham(
      urlName: 'https://image.cellphones.com.vn/358x/media/catalog/product/a/z/azaudio-tai-nghe-bluetooth-apple-airpod-2_2.jpg',
      name: 'Sushi - 寿司',
      loaiId: 1),
  SanPham(
      urlName: 'https://image.cellphones.com.vn/358x/media/catalog/product/a/z/azaudio-tai-nghe-bluetooth-apple-airpod-2_2.jpg',
      name: 'Sushi - 寿司',
      loaiId: 1),
  SanPham(
      urlName: 'https://image.cellphones.com.vn/358x/media/catalog/product/a/z/azaudio-tai-nghe-bluetooth-apple-airpod-2_2.jpg',
      name: 'Sushi - 寿司',
      loaiId: 1),
  SanPham(
      urlName: 'https://image.cellphones.com.vn/358x/media/catalog/product/a/z/azaudio-tai-nghe-bluetooth-apple-airpod-2_2.jpg',
      name: 'Sushi - 寿司',
      loaiId: 1)];


