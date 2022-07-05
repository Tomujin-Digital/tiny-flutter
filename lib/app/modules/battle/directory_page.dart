import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pocket_tomyo/app/modules/battle/battle/battle_loading_page.dart';
import 'package:pocket_tomyo/app/modules/battle/core/components/touchables/flat_button.dart';

class BattleDirectoryPage extends StatefulWidget {
  BattleDirectoryPage({Key? key}) : super(key: key);

  @override
  State<BattleDirectoryPage> createState() => _BattleDirectoryPageState();
}

class _BattleDirectoryPageState extends State<BattleDirectoryPage> {
  Future<void> createRoom() async {
    // POST, /room/join, {roomId: "roomId"}

    // DOCUMENT ID

    // listen on document
    //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Battle Directory")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "Room code",
              ),
            ),
            FilledButton(
              onPressed: createRoom,
              child: Text("Play"),
            ),
          ],
        ),
      ),
    );
  }
}

class FirestoreDemo extends StatefulWidget {
  FirestoreDemo({Key? key}) : super(key: key);

  @override
  State<FirestoreDemo> createState() => _FirestoreDemoState();
}

class _FirestoreDemoState extends State<FirestoreDemo> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('battle').snapshots();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        print("ASDSADA");

        if (snapshot.hasError) {
          return Text('Something went wrong: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return ListTile(
              title: Text(document.id),
              subtitle: Text(data['type']),
            );
          }).toList(),
        );
      },
    );
  }
}
