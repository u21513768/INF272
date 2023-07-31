using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AsyncExample.Models;
using Newtonsoft.Json;

namespace AsyncExample.Controllers
{
    public class SpotifyController : Controller
    {
        private readonly ChinookEntities db = new ChinookEntities();

        // GET: Spotify
        public ActionResult Playlists()
        {
            return View();
        }
        
        public string GetPlaylists()
        {
            object playlistData = db.Playlist.Select(p => new { ID = p.PlaylistId, p.Name, Tracks = p.Track.Count }).ToList();

            return JsonConvert.SerializeObject(playlistData);
        }

        public string AddPlaylist(string name)
        {
            db.Playlist.Add(new Playlist { Name = name });

            db.SaveChanges();

            return JsonConvert.SerializeObject( new { message = "New playlist added!" });
        }

        public string GetPlaylistTracks(int id)
        {
            db.Configuration.ProxyCreationEnabled = false;

            object tracks = db.Playlist.Include("Track.Album.Artist").Where(p => p.PlaylistId == id).SelectMany(s => s.Track);

            object data = new
            {
                db.Playlist.Where(p => p.PlaylistId == id).First().Name,
                Tracks = tracks
            };

            return JsonConvert.SerializeObject(data);
        }

        public ActionResult Tracks()
        {
            return View();
        }

        public string GetTracks()
        {
            db.Configuration.ProxyCreationEnabled = false;

            return JsonConvert.SerializeObject(db.Artist.SelectMany(a => a.Album).SelectMany(a => a.Track));
        }

        public string AddTracksToPlaylist(string data)
        {
            PlaylistTracks playlistTracks = JsonConvert.DeserializeObject<PlaylistTracks>(data);

            Playlist list = db.Playlist.Where(p => p.PlaylistId == playlistTracks.PlaylistId).First();

            foreach (int id in playlistTracks.TrackIds)
            {
                Track track = db.Track.Where(t => t.TrackId == id).First();

                list.Track.Add(track);
            }

            db.SaveChanges();

            return JsonConvert.SerializeObject(new { message = $"Multiple tracks were added to playlist '{list.Name}'" });
        }
    }
}