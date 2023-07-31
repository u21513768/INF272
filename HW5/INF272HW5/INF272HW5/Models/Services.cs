using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
//Quintin d' Hotman de Villiers u21513768
namespace INF272HW5.Models
{
    public class Services
    {
        private SqlConnectionStringBuilder stringBuilder = new SqlConnectionStringBuilder();
        private SqlConnection connection;
        private static Services instance;

        public static Services getInstance()
        {
            if (instance == null)
            {
                instance = new Services();
            }
            return instance;
        }

        public string getConnectionString()
        {

            return "Data Source=DESKTOP-GNVPIS6\\SQLEXPRESS;Initial Catalog=Library;Integrated Security=True";
        }

        public void openConnection()
        {
            try
            {
                connection = new SqlConnection(getConnectionString());
                connection.Open();
            }
            catch (Exception)
            {
            }
        }

        public void closeConnection()
        {
            try
            {
                connection.Close();
            }
            catch (Exception)
            {
            }

        }

        public List<BooksDetails> GetBookDetails()
        {
            List<BooksDetails> books = new List<BooksDetails>();
            try
            {
                openConnection();
                SqlCommand command = new SqlCommand("SELECT b.bookId, b.name AS book, b.pagecount, b.point," +
                " a.surname AS author, t.name AS type FROM books AS b, authors AS a, types AS t " +
                "WHERE t.typeid = b.typeid AND a.authorid = b.authorid", connection); 
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        BooksDetails tmpBook = new BooksDetails();
                        tmpBook.BookID = Convert.ToInt32(reader["bookid"]);
                        tmpBook.Name = reader["book"].ToString();
                        tmpBook.Author = reader["author"].ToString();
                        tmpBook.Type = reader["type"].ToString();
                        tmpBook.PageCount = Convert.ToInt32(reader["pagecount"]);
                        tmpBook.Points = Convert.ToInt32(reader["point"]);

                        string status = setStatus(tmpBook.BookID);

                        if (status == null)
                        {
                            tmpBook.Status = true;
                        }
                        else
                        {
                            tmpBook.Status = false;
                        }
                        
                        books.Add(tmpBook);
                    }
                }
            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                closeConnection();
            }


            return books;
        }

        public List<BooksDetails> GetBookByAll(string title, string type, string author)
        {
            List<BooksDetails> books = new List<BooksDetails>();
            try
            {
                openConnection();
                SqlCommand command = new SqlCommand("SELECT b.bookId, b.name AS book, b.pagecount, b.point," +
                " a.surname AS author, t.name AS type FROM books AS b, authors AS a, types AS t " +
                "WHERE t.typeid = b.typeid AND a.authorid = b.authorid AND t.name = '" + type + "' AND" +
                " b.name = '" + title + "' AND a.surname = '" + author + "'", connection);
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        BooksDetails tmpBook = new BooksDetails();
                        tmpBook.BookID = Convert.ToInt32(reader["bookid"]);
                        tmpBook.Name = reader["book"].ToString();
                        tmpBook.Author = reader["author"].ToString();
                        tmpBook.Type = reader["type"].ToString();
                        tmpBook.PageCount = Convert.ToInt32(reader["pagecount"]);
                        tmpBook.Points = Convert.ToInt32(reader["point"]);

                        string status = setStatus(tmpBook.BookID);

                        if (status == null)
                        {
                            tmpBook.Status = true;
                        }
                        else
                        {
                            tmpBook.Status = false;
                        }

                        books.Add(tmpBook);
                    }
                }
            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                closeConnection();
            }


            return books;
        }

        public List<BooksDetails> GetBookByTT(string title, string type)
        {
            List<BooksDetails> books = new List<BooksDetails>();
            try
            {
                openConnection();
                SqlCommand command = new SqlCommand("SELECT b.bookId, b.name AS book, b.pagecount, b.point," +
                " a.surname AS author, t.name AS type FROM books AS b, authors AS a, types AS t " +
                "WHERE t.typeid = b.typeid AND a.authorid = b.authorid AND t.name = '" + type + "' AND" +
                " b.name = '" + title + "'", connection);
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        BooksDetails tmpBook = new BooksDetails();
                        tmpBook.BookID = Convert.ToInt32(reader["bookid"]);
                        tmpBook.Name = reader["book"].ToString();
                        tmpBook.Author = reader["author"].ToString();
                        tmpBook.Type = reader["type"].ToString();
                        tmpBook.PageCount = Convert.ToInt32(reader["pagecount"]);
                        tmpBook.Points = Convert.ToInt32(reader["point"]);

                        string status = setStatus(tmpBook.BookID);

                        if (status == null)
                        {
                            tmpBook.Status = true;
                        }
                        else
                        {
                            tmpBook.Status = false;
                        }

                        books.Add(tmpBook);
                    }
                }
            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                closeConnection();
            }


            return books;
        }

        public List<BooksDetails> GetBookByTiA(string title, string author)
        {
            List<BooksDetails> books = new List<BooksDetails>();
            try
            {
                openConnection();
                SqlCommand command = new SqlCommand("SELECT b.bookId, b.name AS book, b.pagecount, b.point," +
                " a.surname AS author, t.name AS type FROM books AS b, authors AS a, types AS t " +
                "WHERE t.typeid = b.typeid AND a.authorid = b.authorid AND" +
                " b.name = '" + title + "' AND a.surname = '" + author + "'", connection);
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        BooksDetails tmpBook = new BooksDetails();
                        tmpBook.BookID = Convert.ToInt32(reader["bookid"]);
                        tmpBook.Name = reader["book"].ToString();
                        tmpBook.Author = reader["author"].ToString();
                        tmpBook.Type = reader["type"].ToString();
                        tmpBook.PageCount = Convert.ToInt32(reader["pagecount"]);
                        tmpBook.Points = Convert.ToInt32(reader["point"]);

                        string status = setStatus(tmpBook.BookID);

                        if (status == null)
                        {
                            tmpBook.Status = true;
                        }
                        else
                        {
                            tmpBook.Status = false;
                        }

                        books.Add(tmpBook);
                    }
                }
            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                closeConnection();
            }


            return books;
        }

        public List<BooksDetails> GetBookByTyA(string type, string author)
        {
            List<BooksDetails> books = new List<BooksDetails>();
            try
            {
                openConnection();
                SqlCommand command = new SqlCommand("SELECT b.bookId, b.name AS book, b.pagecount, b.point," +
                " a.surname AS author, t.name AS type FROM books AS b, authors AS a, types AS t " +
                "WHERE t.typeid = b.typeid AND a.authorid = b.authorid AND t.name = '" + type + "' AND" +
                "  a.surname = '" + author + "'", connection);
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        BooksDetails tmpBook = new BooksDetails();
                        tmpBook.BookID = Convert.ToInt32(reader["bookid"]);
                        tmpBook.Name = reader["book"].ToString();
                        tmpBook.Author = reader["author"].ToString();
                        tmpBook.Type = reader["type"].ToString();
                        tmpBook.PageCount = Convert.ToInt32(reader["pagecount"]);
                        tmpBook.Points = Convert.ToInt32(reader["point"]);

                        string status = setStatus(tmpBook.BookID);

                        if (status == null)
                        {
                            tmpBook.Status = true;
                        }
                        else
                        {
                            tmpBook.Status = false;
                        }

                        books.Add(tmpBook);
                    }
                }
            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                closeConnection();
            }


            return books;
        }

        public List<BooksDetails> GetBookByType(string type)
        {
            List<BooksDetails> books = new List<BooksDetails>();
            try
            {
                openConnection();
                SqlCommand command = new SqlCommand("SELECT b.bookId, b.name AS book, b.pagecount, b.point," +
                " a.surname AS author, t.name AS type FROM books AS b, authors AS a, types AS t " +
                "WHERE t.typeid = b.typeid AND a.authorid = b.authorid AND t.name = '" + type + "'", connection);
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        BooksDetails tmpBook = new BooksDetails();
                        tmpBook.BookID = Convert.ToInt32(reader["bookid"]);
                        tmpBook.Name = reader["book"].ToString();
                        tmpBook.Author = reader["author"].ToString();
                        tmpBook.Type = reader["type"].ToString();
                        tmpBook.PageCount = Convert.ToInt32(reader["pagecount"]);
                        tmpBook.Points = Convert.ToInt32(reader["point"]);

                        string status = setStatus(tmpBook.BookID);

                        if (status == null)
                        {
                            tmpBook.Status = true;
                        }
                        else
                        {
                            tmpBook.Status = false;
                        }

                        books.Add(tmpBook);
                    }
                }
            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                closeConnection();
            }


            return books;
        }

        public List<BooksDetails> GetBookByTitle(string title)
        {
            List<BooksDetails> books = new List<BooksDetails>();
            try
            {
                openConnection();
                SqlCommand command = new SqlCommand("SELECT b.bookId, b.name AS book, b.pagecount, b.point," +
                " a.surname AS author, t.name AS type FROM books AS b, authors AS a, types AS t " +
                "WHERE t.typeid = b.typeid AND a.authorid = b.authorid AND" +
                " b.name = '" + title + "'", connection);
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        BooksDetails tmpBook = new BooksDetails();
                        tmpBook.BookID = Convert.ToInt32(reader["bookid"]);
                        tmpBook.Name = reader["book"].ToString();
                        tmpBook.Author = reader["author"].ToString();
                        tmpBook.Type = reader["type"].ToString();
                        tmpBook.PageCount = Convert.ToInt32(reader["pagecount"]);
                        tmpBook.Points = Convert.ToInt32(reader["point"]);

                        string status = setStatus(tmpBook.BookID);

                        if (status == null)
                        {
                            tmpBook.Status = true;
                        }
                        else
                        {
                            tmpBook.Status = false;
                        }

                        books.Add(tmpBook);
                    }
                }
            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                closeConnection();
            }


            return books;
        }

        public List<BooksDetails> GetBookByAuthor(string author)
        {
            List<BooksDetails> books = new List<BooksDetails>();
            try
            {
                openConnection();
                SqlCommand command = new SqlCommand("SELECT b.bookId, b.name AS book, b.pagecount, b.point," +
                " a.surname AS author, t.name AS type FROM books AS b, authors AS a, types AS t " +
                "WHERE t.typeid = b.typeid AND a.authorid = b.authorid AND a.surname = '" + author + "'", connection);
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        BooksDetails tmpBook = new BooksDetails();
                        tmpBook.BookID = Convert.ToInt32(reader["bookid"]);
                        tmpBook.Name = reader["book"].ToString();
                        tmpBook.Author = reader["author"].ToString();
                        tmpBook.Type = reader["type"].ToString();
                        tmpBook.PageCount = Convert.ToInt32(reader["pagecount"]);
                        tmpBook.Points = Convert.ToInt32(reader["point"]);

                        string status = setStatus(tmpBook.BookID);

                        if (status == null)
                        {
                            tmpBook.Status = true;
                        }
                        else
                        {
                            tmpBook.Status = false;
                        }

                        books.Add(tmpBook);
                    }
                }
            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                closeConnection();
            }


            return books;
        }

        public BorrowsVM GetBorrowDetails(int bookID)
        {
            BorrowsVM newVM = new BorrowsVM();
            List<BorrowsDetails> borrows = new List<BorrowsDetails>();
            int count = 0;

            try
            {
                openConnection();
                SqlCommand command = new SqlCommand("SELECT Borrows.bookid, Borrows.borrowid, Borrows.takendate, Borrows.broughtdate, Students.name AS student, Students.surname, Borrows.studentid," +
                                                    " Books.name AS book FROM Borrows, Students, Books WHERE Borrows.bookid = " + bookID + "AND " +
                                                    "Students.studentid = Borrows.studentid AND Books.bookid = Borrows.bookid ORDER BY Borrows.borrowid DESC", connection);
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        BorrowsDetails tmpBorrow = new BorrowsDetails();
                        tmpBorrow.StudentID = Convert.ToInt32(reader["studentid"]);
                        tmpBorrow.BookID = Convert.ToInt32(reader["bookid"]);
                        tmpBorrow.BorrowID = Convert.ToInt32(reader["borrowid"]);
                        tmpBorrow.TakenDate = Convert.ToDateTime(reader["takendate"]);
                        tmpBorrow.BroughtDate = Convert.ToDateTime(reader["broughtdate"]);
                        tmpBorrow.Name = reader["student"].ToString() + " " + reader["surname"].ToString();
                        tmpBorrow.BookName = reader["book"].ToString();

                        borrows.Add(tmpBorrow);
                        count++;
                    }
                }
            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                closeConnection();
            }

            newVM.BorrowsDetails = borrows;
            newVM.count = count;
            return newVM;
        }

        public List<StudentDetails> GetStudents(int bookID)
        {
            List<StudentDetails> students = new List<StudentDetails>();
            try
            {
                openConnection();
                SqlCommand command = new SqlCommand("SELECT DISTINCT Borrows.bookid, Students.studentid, Students.name, Students.surname, " +
                                                    "Students.birthdate, Students.gender, Students.class, Students.point" +
                                                    " FROM Students, Borrows WHERE Borrows.bookid = " + bookID, connection);

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        StudentDetails tmpStud = new StudentDetails();
                        tmpStud.BookID = Convert.ToInt32(reader["bookid"]);
                        tmpStud.StudentID = Convert.ToInt32(reader["studentid"]);
                        tmpStud.Name = reader["name"].ToString();
                        tmpStud.Surname = reader["surname"].ToString();
                        tmpStud.BirthDate = Convert.ToDateTime(reader["birthdate"]);
                        tmpStud.Gender = Convert.ToChar(reader["gender"]);
                        tmpStud.Class = reader["class"].ToString();
                        tmpStud.Point = Convert.ToInt32(reader["point"]);

                        students.Add(tmpStud);
                    }
                }
            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                closeConnection();
            }

            return students;
        }

        public List<StudentDetails> GetStudentsByAll(int bookID, string name, string type)
        {
            List<StudentDetails> students = new List<StudentDetails>();
            try
            {
                openConnection();
                SqlCommand command = new SqlCommand("SELECT DISTINCT Borrows.bookid, Students.studentid, Students.name, Students.surname, " +
                                                    "Students.birthdate, Students.gender, Students.class, Students.point" +
                                                    " FROM Students, Borrows WHERE Borrows.bookid = " + bookID + " " +
                                                    "AND " +
                                                    "Students.name = '" + name + "' AND Students.Class = '" + type + "'", connection);

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        StudentDetails tmpStud = new StudentDetails();
                        tmpStud.BookID = Convert.ToInt32(reader["bookid"]);
                        tmpStud.StudentID = Convert.ToInt32(reader["studentid"]);
                        tmpStud.Name = reader["name"].ToString();
                        tmpStud.Surname = reader["surname"].ToString();
                        tmpStud.BirthDate = Convert.ToDateTime(reader["birthdate"]);
                        tmpStud.Gender = Convert.ToChar(reader["gender"]);
                        tmpStud.Class = reader["class"].ToString();
                        tmpStud.Point = Convert.ToInt32(reader["point"]);

                        students.Add(tmpStud);
                    }
                }
            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                closeConnection();
            }

            return students;
        }

        public List<StudentDetails> GetStudentsByName(int bookID, string name)
        {
            List<StudentDetails> students = new List<StudentDetails>();
            try
            {
                openConnection();
                SqlCommand command = new SqlCommand("SELECT DISTINCT Borrows.bookid, Students.studentid, Students.name, Students.surname, " +
                                                    "Students.birthdate, Students.gender, Students.class, Students.point" +
                                                    " FROM Students, Borrows WHERE Borrows.bookid = " + bookID + " " +
                                                    "AND " +
                                                    "Students.name = '" + name + "'", connection);

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        StudentDetails tmpStud = new StudentDetails();
                        tmpStud.BookID = Convert.ToInt32(reader["bookid"]);
                        tmpStud.StudentID = Convert.ToInt32(reader["studentid"]);
                        tmpStud.Name = reader["name"].ToString();
                        tmpStud.Surname = reader["surname"].ToString();
                        tmpStud.BirthDate = Convert.ToDateTime(reader["birthdate"]);
                        tmpStud.Gender = Convert.ToChar(reader["gender"]);
                        tmpStud.Class = reader["class"].ToString();
                        tmpStud.Point = Convert.ToInt32(reader["point"]);

                        students.Add(tmpStud);
                    }
                }
            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                closeConnection();
            }

            return students;
        }

        public List<StudentDetails> GetStudentsByClass(int bookID, string type)
        {
            List<StudentDetails> students = new List<StudentDetails>();
            try
            {
                openConnection();
                SqlCommand command = new SqlCommand("SELECT DISTINCT Borrows.bookid, Students.studentid, Students.name, Students.surname, " +
                                                    "Students.birthdate, Students.gender, Students.class, Students.point" +
                                                    " FROM Students, Borrows WHERE Borrows.bookid = " + bookID + " " +
                                                    "AND " +
                                                    " Students.Class = '" + type + "'", connection);

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        StudentDetails tmpStud = new StudentDetails();
                        tmpStud.BookID = Convert.ToInt32(reader["bookid"]);
                        tmpStud.StudentID = Convert.ToInt32(reader["studentid"]);
                        tmpStud.Name = reader["name"].ToString();
                        tmpStud.Surname = reader["surname"].ToString();
                        tmpStud.BirthDate = Convert.ToDateTime(reader["birthdate"]);
                        tmpStud.Gender = Convert.ToChar(reader["gender"]);
                        tmpStud.Class = reader["class"].ToString();
                        tmpStud.Point = Convert.ToInt32(reader["point"]);

                        students.Add(tmpStud);
                    }
                }
            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                closeConnection();
            }

            return students;
        }

        public void BorrowBook(int bookID, int studentID) 
        {
            try
            {
                openConnection();
                SqlCommand myInsertCommand = new SqlCommand("INSERT INTO Borrows (studentid, bookid, takendate, broughtdate) " +
                                                            "VALUES('" + studentID + "', '" + bookID + "', '" + DateTime.Now + "', '1900')", connection);


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

        public void ReturnBook(int bookID) 
        {
            try
            {
                openConnection();
                SqlCommand myInsertCommand = new SqlCommand("UPDATE Borrows SET broughtdate = '" + DateTime.Now +
                                                            "' WHERE bookid = " + bookID + " AND broughtdate = '1900'", connection);

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

        public string setStatus(int bookID)
        {
            SqlConnection newCon = new SqlConnection(getConnectionString());
            try
            {
                
                newCon.Open();
                SqlCommand ifCheck = new SqlCommand("SELECT * FROM Borrows WHERE Borrows.bookid = '" + bookID + "' AND Borrows.broughtdate = '1900'", newCon);
                using (SqlDataReader reader = ifCheck.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        return reader["borrowid"].ToString();
                    }
                }
                
            }
            catch(Exception)
            {
                throw;
            }
            finally
            {
                newCon.Close();
            }

            return null;
        }

        public List<string> GetTypes()
        {
            List<string> Types = new List<string>();
            try
            {
                openConnection();
                SqlCommand command = new SqlCommand("SELECT DISTINCT types.name from types", connection);

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        string newStr;
                        newStr = reader["name"].ToString();
                        
                        Types.Add(newStr);
                    }
                }
            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                closeConnection();
            }

            return Types;
        }

        public List<string> GetAuthors()
        {
            List<string> Authors = new List<string>();
            try
            {
                openConnection();
                SqlCommand command = new SqlCommand("SELECT DISTINCT authors.surname from authors", connection);

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        string newStr;
                        newStr = reader["surname"].ToString();

                        Authors.Add(newStr);
                    }
                }
            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                closeConnection();
            }

            return Authors;
        }

        public List<string> GetClasses(int bookID)
        {
            List<string> Classes = new List<string>();
            try
            {
                openConnection();
                SqlCommand command = new SqlCommand("SELECT DISTINCT students.class FROM students, borrows WHERE" +
                                                    " borrows.bookid = " + bookID + " AND students.studentid = borrows.studentid", connection);

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        string newStr;
                        newStr = reader["class"].ToString();

                        Classes.Add(newStr);
                    }
                }
            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                closeConnection();
            }

            return Classes;
        }
    }
}