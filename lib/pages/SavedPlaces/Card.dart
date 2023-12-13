import 'package:flutter/material.dart';

import 'StorageClass.dart';

class SavedPlaceCard extends StatefulWidget {
  final SavedPlace place;
  final VoidCallback onTap;
  final bool showDistance; // Flag to control distance display

  const SavedPlaceCard({
    required this.place,
    required this.onTap,
    this.showDistance = false, // Default: hide distance
  });

  @override
  State<SavedPlaceCard> createState() => _SavedPlaceCardState();
}

class _SavedPlaceCardState extends State<SavedPlaceCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    widget.place.name,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  if (widget.place.category != null) Spacer(),
                  if (widget.place.category != null)
                    Text(
                      widget.place.category!,
                      style: Theme.of(context).textTheme.caption,
                    ),
                ],
              ),
              if (widget.place.description != null)
                Text(
                  widget.place.description!,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              if (widget.place.mapThumbnailUrl != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(widget.place.mapThumbnailUrl),
                  ),
                ),
              if (widget.showDistance)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      // Calculate and display distance based on your logic
                      // (e.g., using Geolocator package)
                      // DistanceUtil.getDistanceText(context, place.latitude, place.longitude),
                      "Distance",
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon:
                        Icon(Icons.star_border), // Use star_border for outline
                    onPressed: () {
                      // Implement logic to add/remove star rating
                      // Update the SavedPlace object and storage
                    },
                  ),
                  // IconButton(
                  //   icon: Icon(Icons.delete),
                  //   onPressed: () async {
                  //     await SavedPlacesStorage.deleteSavedPlace(widget.place);
                  //     setState(() {
                  //       Null;
                  //       //   _savedPlacesFuture =
                  //       //       SavedPlacesStorage.getSavedPlaces(); // Update list
                  //     });
                  //   },
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
