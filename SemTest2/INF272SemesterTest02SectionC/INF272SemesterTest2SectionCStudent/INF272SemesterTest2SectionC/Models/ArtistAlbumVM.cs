using System;
using System.Collections.Generic;

namespace INF272SemesterTest2SectionC.Models
{
    public class ArtistAlbumVM
    {
        public Artist Artist { get; set; }
        public List<Album> Albums { get; set; }
        public Album ChosenRandomAlbum { get; set; }

        public Album getRandomAlbum() {
            if (Albums.Count > 0)
            {
                Random rndGen = new Random();
                int index = rndGen.Next(Albums.Count);
                ChosenRandomAlbum = Albums[index];
            }
            return ChosenRandomAlbum;
        }
    }
}
