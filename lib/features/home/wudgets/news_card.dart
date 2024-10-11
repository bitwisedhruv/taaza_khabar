import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0), // Rounded corners
      ),
      elevation: 0,
      color: Colors.white, // Shadow effect
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0), // Padding around the card
        child: Row(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align items at the top
          children: [
            // Image container

            // Space between image and text
            // Text content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'News Source',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                      height: 4), // Small spacing between title and subtitle
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8), // Spacing between text and time
                  Text(
                    '10 min ago',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Container(
              width: 100, // Control image size (width)
              height: 100, // Control image size (height)
              clipBehavior:
                  Clip.hardEdge, // To ensure the image doesn't overflow
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(10), // Rounded image corners
              ),
              child: Image.network(
                'https://media.istockphoto.com/id/1369150014/vector/breaking-news-with-world-map-background-vector.jpg?s=612x612&w=0&k=20&c=9pR2-nDBhb7cOvvZU_VdgkMmPJXrBQ4rB1AkTXxRIKM=', // Replace with your image URL
                fit: BoxFit.cover, // Make the image cover the container
              ),
            ),
          ],
        ),
      ),
    );
  }
}
