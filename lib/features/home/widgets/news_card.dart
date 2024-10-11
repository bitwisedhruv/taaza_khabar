import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final String headline;
  final String description;
  final String publishedAt;
  final String imageUrl;
  const NewsCard({
    super.key,
    required this.headline,
    required this.description,
    required this.publishedAt,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0), // Rounded corners
      ),
      elevation: 0,
      color: Colors.white, // Shadow effect
      margin: const EdgeInsets.all(8.0),
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
                    headline,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                      height: 4), // Small spacing between title and subtitle
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8), // Spacing between text and time
                  Text(
                    publishedAt,
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
                imageUrl,
                fit: BoxFit.cover, // Make the image cover the container
              ),
            ),
          ],
        ),
      ),
    );
  }
}
