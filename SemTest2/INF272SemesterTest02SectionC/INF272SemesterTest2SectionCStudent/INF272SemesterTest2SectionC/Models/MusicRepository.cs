using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;

namespace INF272SemesterTest2SectionC.Models
{
    public class MusicRepository
    {
        public static String sqlDBConnectionString = "Data Source=DESKTOP-GNVPIS6\\SQLEXPRESS;Initial Catalog=Chinook;Integrated Security=True"; //DOn't forget to modify the string

        public static List<Artist> GetArtists() {
            List<Artist> artists = new List<Artist>();

            //TODO: read artists
            SqlConnection connection = new SqlConnection(sqlDBConnectionString);
            try
            {
                connection.Open();
                SqlCommand command = new SqlCommand("SELECT * FROM Artist", connection);
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Artist tmpArt = new Artist();

                        tmpArt.ID = Convert.ToInt32(reader["ArtistId"]);
                        tmpArt.Name = reader["Name"].ToString();
                        

                        artists.Add(tmpArt);
                    }
                }

            }
            catch
            {
            }
            finally
            {
                connection.Close();
            }
            return artists;
        }

        public static List<Album> GetAlbumsOfArtist(int artistID) {
            List<Album> albums = GetAlbums().Where(album => album.ArtistID == artistID).ToList();
            return albums;
        }

        public static void DeleteAlbum(int AlbumID) {
            //TODO: remove album
            SqlConnection connection = new SqlConnection(sqlDBConnectionString);

            try
            {
                connection.Open();
                SqlCommand myDeleteCommand = new SqlCommand("Delete from Album where AlbumId = " + AlbumID, connection);

                int rowsAffected = myDeleteCommand.ExecuteNonQuery();
            }
            catch (Exception)
            {
                
            }
            finally
            {
                connection.Close();
            }
        }

        public static void DeleteArtist(int ArtistID)
        {
            //TODO: remove artist
            SqlConnection connection = new SqlConnection(sqlDBConnectionString);

            try
            {
                connection.Open();
                SqlCommand myDeleteCommand = new SqlCommand("Delete from Artist where ArtistId = " + ArtistID, connection);

                int rowsAffected = myDeleteCommand.ExecuteNonQuery();
            }
            catch (Exception)
            {

            }
            finally
            {
                connection.Close();
            }
        }

        public static List<Album> GetAlbums() {
            List<Album> albums = new List<Album>();

            //TODO: read albums
            SqlConnection connection = new SqlConnection(sqlDBConnectionString);
            try
            {
                connection.Open();
                SqlCommand command = new SqlCommand("SELECT * FROM Album", connection);
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Album tmpAlb = new Album();

                        tmpAlb.ID = Convert.ToInt32(reader["AlbumId"]);
                        tmpAlb.ArtistID = Convert.ToInt32(reader["ArtistId"]);
                        tmpAlb.Title = reader["Title"].ToString();


                        albums.Add(tmpAlb);
                    }
                }

            }
            catch
            {
            }
            finally
            {
                connection.Close();
            }
            return albums;
        }
    }
}
