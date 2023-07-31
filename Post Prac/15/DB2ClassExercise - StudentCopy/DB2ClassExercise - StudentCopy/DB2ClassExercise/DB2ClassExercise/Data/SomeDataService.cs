using System;
using System.Collections.Generic;
using DB2ClassExercise.Models;
using System.Data.SqlClient;

namespace DB2ClassExercise.Data
{
    public class SomeDataService
    {

        private static SomeDataService instance;
        public String connectionString;

        public static SomeDataService getInstance() {
            if (instance == null) {
                instance = new SomeDataService();
            }
            return instance;
        }

        public void setConnectionString(String someConnStr) {
            connectionString = someConnStr;
        }

        public List<Course> getAvailableCourses() {
            List<Course> data = new List<Course>();
            SqlConnection connection = new SqlConnection(connectionString);
            //TODO: Complete this
            try
            {
                connection.Open();
                SqlCommand command = new SqlCommand("select * from Courses", connection);
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Course tmpCourse = new Course();
                        tmpCourse.Name = reader["Name"].ToString();
                        tmpCourse.Description = reader["Description"].ToString();
                        tmpCourse.ID = Convert.ToInt32(reader["ID"]);

                        data.Add(tmpCourse);
                    }
                }
                connection.Close();
            }
            catch
            {
            }
            return data;
        }

        //TODO: Uncommment and complete this

        public List<Assignment> getAssignmentsOfCourse(int courseID)
        {
            List <Assignment> assignments = new List<Assignment> ();
            SqlConnection connection = new SqlConnection(connectionString);
            //TODO: Complete this
            try
            {
                connection.Open();
                SqlCommand command = new SqlCommand("SELECT a.Name AS course, a.Description, b.Name AS staff, c.Name AS student, d.ID FROM Courses AS a, Staff AS b, Students AS c, CourseAssignmentsMarking as d " +
                                                    "WHERE d.CourseID = '" + courseID + "' AND a.ID = d.CourseID AND c.ID = d.StudentID AND b.ID = d.MarkerID", connection);
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Assignment tmpAss = new Assignment();

                        tmpAss.ID = Convert.ToInt32(reader["ID"]);
                        tmpAss.CourseName = reader["course"].ToString();
                        tmpAss.CourseDescription = reader["Description"].ToString();
                        tmpAss.StudentName = reader["student"].ToString();
                        tmpAss.StaffName = reader["staff"].ToString();

                        assignments.Add(tmpAss);
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

            return assignments;
        }


    }
}
