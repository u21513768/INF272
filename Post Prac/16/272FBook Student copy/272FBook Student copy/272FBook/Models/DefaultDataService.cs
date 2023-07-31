using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;

namespace RandomCourseFBook.Models
{
    public class DefaultDataService
    {
        private String ConnectionString;
        public static List<MarkRange> markRanges = null;

        public DefaultDataService() {
            ConnectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            markRanges = new List<MarkRange>();
            markRanges.Add(new MarkRange { Symbol = "F", MinOfRange = 0, MaxOfRange = 59 });
            markRanges.Add(new MarkRange { Symbol = "D", MinOfRange = 60, MaxOfRange = 64 });
            markRanges.Add(new MarkRange { Symbol = "D+", MinOfRange = 65, MaxOfRange = 69 });
            markRanges.Add(new MarkRange { Symbol = "C", MinOfRange = 70, MaxOfRange = 74 });
            markRanges.Add(new MarkRange { Symbol = "C+", MinOfRange = 75, MaxOfRange = 79 });
            markRanges.Add(new MarkRange { Symbol = "B", MinOfRange = 80, MaxOfRange = 84 });
            markRanges.Add(new MarkRange { Symbol = "B+", MinOfRange = 85, MaxOfRange = 89 });
            markRanges.Add(new MarkRange { Symbol = "A", MinOfRange = 90, MaxOfRange = 94 });
            markRanges.Add(new MarkRange { Symbol = "A+", MinOfRange = 95, MaxOfRange = 100 });
        }

        public List<Student> getAllStudentsByMarkRange(int min, int max)
        {
            List<Student> students = new List<Student>();
            //TODO: get all students whose grade falls between min and max (inclusive)
            SqlConnection connection = new SqlConnection(ConnectionString);
            
            try
            {
                connection.Open();
                SqlCommand command = new SqlCommand("SELECT * FROM Students WHERE Grade >= " + min + " AND Grade <= " + max, connection);
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Student tmpStudent = new Student();

                        tmpStudent.ID = Convert.ToInt32(reader["ID"]);
                        tmpStudent.FirstName = reader["FirstName"].ToString();
                        tmpStudent.Surname = reader["LastName"].ToString();
                        tmpStudent.Sex = reader["Sex"].ToString();
                        tmpStudent.Grade = Convert.ToInt32(reader["Grade"]);

                        students.Add(tmpStudent);
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

            return students;
        }


        public List<Student> getAllStudentsBySexAndMarkRange(String sex, int min, int max)
        {
            List<Student> students = new List<Student>();
            //TODO: get all students whose grade falls between min and max (inclusive) and whose recorded sex matches the method's first argument
            SqlConnection connection = new SqlConnection(ConnectionString);
            
            try
            {
                connection.Open();
                SqlCommand command = new SqlCommand("SELECT * FROM Students WHERE Grade >= " + min + " AND Grade <= " + max + " AND sex = '" + sex + "'", connection);
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Student tmpStudent = new Student();

                        tmpStudent.ID = Convert.ToInt32(reader["ID"]);
                        tmpStudent.FirstName = reader["FirstName"].ToString();
                        tmpStudent.Surname = reader["LastName"].ToString();
                        tmpStudent.Sex = reader["Sex"].ToString();
                        tmpStudent.Grade = Convert.ToInt32(reader["Grade"]);

                        students.Add(tmpStudent);
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
            return students;
        }

        public List<Image> getAllImages() {
            List<Image> images = new List<Image>();
            //TODO: Retrieve all the information associated with the images
            SqlConnection connection = new SqlConnection(ConnectionString);

            try
            {
                connection.Open();
                SqlCommand command = new SqlCommand("SELECT * FROM Images", connection);
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Image tmpImg = new Image();

                        tmpImg.StudentID = Convert.ToInt32(reader["StudentID"]);
                        tmpImg.ImageRaw = reader["B64Image"].ToString();
                        
                        images.Add(tmpImg);
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
            return images;
        }
    }
}