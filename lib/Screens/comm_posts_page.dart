import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../models/comm_post.dart';
import 'add_post_page.dart';

class CommunityPosts extends StatelessWidget {
  const CommunityPosts({Key? key, required this.isAdmin}) : super(key: key);

  final bool isAdmin;

  // Delete post from firebase storage and firestore
  Future<void> _deletePost(Post post) async {
    try {
      final storage = FirebaseStorage.instance;
      final ref = storage.refFromURL(post.image);
      await ref.delete();
      await FirebaseFirestore.instance
          .collection('posts')
          .doc(post.id)
          .delete();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community Posts'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('posts').snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Something went wrong'),
            );
          }

          if (snapshot.connectionState != ConnectionState.active) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          if (snapshot.data == null || snapshot.data.docs.isEmpty) {
            return const Center(child: Text('No posts found'));
          }

          final posts =
              snapshot.data.docs.map((e) => Post.fromMap(e.data())).toList();
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final Post post = posts[index];
              return Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(post.title),
                    Text(post.description),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                        imageUrl: post.image,
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        width: double.infinity,
                        height: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.location_on_rounded),
                        const SizedBox(width: 8),
                        Text(post.location),
                        const Spacer(),
                        if (isAdmin)
                          IconButton(
                            onPressed: () => _deletePost(post),
                            icon: const Icon(Icons.delete_rounded),
                          ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddPostPage(),
            ),
          );
        },
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}
