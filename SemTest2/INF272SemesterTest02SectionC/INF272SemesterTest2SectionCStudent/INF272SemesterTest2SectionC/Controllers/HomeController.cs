using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using INF272SemesterTest2SectionC.Models;

namespace INF272SemesterTest2SectionC.Controllers
{
    public class HomeController : Controller
    {

        public ActionResult Index()
        {
            List<ArtistAlbumVM> artistAlbumVms = new List<ArtistAlbumVM>();

            List<Artist> artists = MusicRepository.GetArtists();
            foreach (Artist artist in artists) {
                ArtistAlbumVM artistAlbumVM = new ArtistAlbumVM
                {
                    Artist = artist,
                    Albums = MusicRepository.GetAlbumsOfArtist(artist.ID)
                };
                artistAlbumVms.Add(artistAlbumVM);
            }

            return View(artistAlbumVms);
        }

        public ActionResult DeleteAlbum(int AlbumID) {
            MusicRepository.DeleteAlbum(AlbumID);
            return RedirectToAction("Index");
        }


        public ActionResult DeleteArtist(int ArtistID) {
            MusicRepository.DeleteArtist(ArtistID);
            return RedirectToAction("Index");
        }

    }
}
