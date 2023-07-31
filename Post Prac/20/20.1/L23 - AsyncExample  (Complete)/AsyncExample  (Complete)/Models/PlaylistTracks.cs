using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AsyncExample.Models
{
    public class PlaylistTracks
    {
        public int PlaylistId { get; set; }
        public int[] TrackIds { get; set; }
    }
}