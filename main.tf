terraform {
  required_providers {
    spotify = {
      version = "~> 0.2.6"
      source  = "conradludgate/spotify"
    }
  }
}

provider "spotify" {
  api_key = var.spotify_api_key
}



data "spotify_search_track" "by_artist" {
  artist = "Tori Kelly"
  #  album = "Jolene"
  #  name  = "Early Morning Breeze"
}







resource "spotify_playlist" "playlist" {
  name        = "Tori Kelly playlist"
  description = "This playlist was created by Tunde Oyewo using Terraform"
  public      = true

  tracks = [
    data.spotify_search_track.by_artist.tracks[0].id,
    data.spotify_search_track.by_artist.tracks[1].id,
    data.spotify_search_track.by_artist.tracks[2].id,
    data.spotify_search_track.by_artist.tracks[3].id,
    data.spotify_search_track.by_artist.tracks[4].id,
  ]



 
}

# Below creates playlist by ID
# # Optional: Find song by ID
# data "spotify_track" "Thank_You_Lord_Live_by_id" {
#   spotify_id = "6tzwFtw4AHo2tCexPGMzUN"
# }

# data "spotify_track" "Our_Father_by_id" {
#   spotify_id = "3WUw5mYK80vnw7jZd4JNny"
# }

# resource "spotify_playlist" "playlist" {
#   name        = "my Terraform playlist"
#   description = "This playlist was created by Tunde Oyewo using Terraform"
#   public      = true

#     tracks = [
#     data.spotify_track.Thank_You_Lord_Live_by_id.id,
#     data.spotify_track.Our_Father_by_id.id,
#   ]
# }
