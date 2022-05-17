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

# data "spotify_search_track" "by_artist" {
#   artist = "Dolly Parton"
#   #  album = "Jolene"
#   #  name  = "Early Morning Breeze"
# }

# data "spotify_search_track" "by_artist" {
#   artist = "Don Moen"
#   #  album = "Jolene"
#   #  name  = "Early Morning Breeze"
# }

# Optional: Find song by ID
data "spotify_track" "early_morning_breeze_by_id" {
  spotify_id = "3CkJeQjxbYJsLN2MLAvluL"
}

# resource "spotify_playlist" "playlist" {
#   name        = "Terraform Summer Playlist"
#   description = "This playlist was created by Terraform"
#   public      = true

#   tracks = [
#     data.spotify_search_track.by_artist.tracks[0].id,
#     data.spotify_search_track.by_artist.tracks[1].id,
#     data.spotify_search_track.by_artist.tracks[2].id,
#   ]
# }

resource "spotify_playlist" "playlist" {
  name        = "my Terraform playlist"
  description = "This playlist was created by Tunde Oyewo using Terraform"
  public      = true

  # tracks = [
  #   data.spotify_search_track.by_artist.tracks[0].id,
  #   data.spotify_search_track.by_artist.tracks[1].id,
  #   data.spotify_search_track.by_artist.tracks[2].id,
  #   data.spotify_search_track.by_artist.tracks[3].id,
  #   data.spotify_search_track.by_artist.tracks[4].id,
  # ]

   tracks = [
    data.spotify_track.early_morning_breeze_by_id.id
    # data.spotify_search_track.by_artist.tracks[1].id,
    # data.spotify_search_track.by_artist.tracks[2].id,
    # data.spotify_search_track.by_artist.tracks[3].id,
    # data.spotify_search_track.by_artist.tracks[4].id,
  ]
}
