using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace INF272DB1StudentFiles2022.Models
{
    public class DataService
    {

        //it is optional to use the Stringbuilder but as was explained in the video, this makes your database more secure
        private SqlConnectionStringBuilder stringBuilder = new SqlConnectionStringBuilder(); 

        private SqlConnection currConnection;

        //The code below 'declares' the DataSevice class as a singleton
        private static DataService instance;
        public static DataService getDataService()
        {
            if (instance == null)
            {
                instance = new DataService();
            }
            return instance;
        }

        //Complete the missing code below

        public string getConnectionString()
        {

            return "Data Source=DESKTOP-GNVPIS6\\SQLEXPRESS;Initial Catalog=SATouristAttractions;Integrated Security=True";
        }
        
        public bool openConnection()
        {
            try
            {
                currConnection = new SqlConnection(getConnectionString());
                currConnection.Open();

                return true;
            }
            catch (Exception)
            {
                
                return false;
            }
        }

        public bool closeConnection()
        {
            try
            {
                currConnection.Close();

                return true;
            }
            catch (Exception)
            {

                return false;
            }

        }

        public bool deleteDest(int id)
        {
            try
            {
                openConnection();
                SqlCommand myDeleteCommand = new SqlCommand("Delete from TouristSites where ID=" + id, currConnection);

                
                int rowsAffected = myDeleteCommand.ExecuteNonQuery();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
            finally
            {
                closeConnection();
            }

        }

        public bool updateDest(DestinationModel someDest)
        {
            try
            {
                openConnection();
                SqlCommand myUpdateCommand = new SqlCommand("Update TouristSites Set Name='" + someDest.Name + "', website='" + someDest.Website + "' where ID=" + someDest.ID, currConnection);

                
                int rowsAffected = myUpdateCommand.ExecuteNonQuery();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
            finally
            {
                closeConnection();
            }
            

        }

        public void createDest(DestinationModel someDest)
        {
            try
            {
                openConnection();
                SqlCommand myInsertCommand = new SqlCommand("INSERT INTO TouristSites (name, website) VALUES('" + someDest.Name + "','" + someDest.Website + "')", currConnection);

                
                int rowsAffected = myInsertCommand.ExecuteNonQuery();
                
                
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                closeConnection();
            }
        }

        //code is provided for the read functionality below.
        //Name, Website and ID refers to class properties
        public List<DestinationModel> getDest()
        {

            List<DestinationModel> destinations = new List<DestinationModel>();
            try
            {
                openConnection();
                SqlCommand command = new SqlCommand("select * from TouristSites", currConnection);
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        DestinationModel tmpDest = new DestinationModel();
                        tmpDest.Name = reader["Name"].ToString();
                        tmpDest.Website = reader["Website"].ToString();
                        tmpDest.ID = Convert.ToInt32(reader["id"]);

                        destinations.Add(tmpDest);
                    }
                }
                closeConnection();
            }
            catch
            {
            }
        
            return destinations;
        }

        //code is provided to get one Destination by id - ID refers here to a DestinationModel class property.
        public DestinationModel getDestById(int id)
        {
            DestinationModel dest = null;
            List<DestinationModel> dests = getDest();

            if (dests.Any(d => d.ID == id))
            {
                int index = dests.FindIndex(d => d.ID == id);
                dest = dests[index];
            }

            return dest;
        }








    }
}