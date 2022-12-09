import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class deposit extends StatefulWidget {
  const deposit({super.key, required this.isChild, required this.password});
  final String password;
  final bool isChild;
}
