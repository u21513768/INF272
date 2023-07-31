using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using INF272HW5.Models;
//Quintin d' Hotman de Villiers u21513768
namespace INF272HW5.Controllers
{
    public class HomeController : Controller
    {
        private Services dataService = Services.getInstance();

        //public ActionResult Index()
        //{
        //    return View();
        //}

        [HttpGet]
        public ActionResult Index()
        {
            ViewBag.Message = "Book Details Page.";
            BookVM newBooks = new BookVM();
            newBooks.BooksDetails = dataService.GetBookDetails();
            newBooks.Types = dataService.GetTypes();
            newBooks.Authors = dataService.GetAuthors();

            return View(newBooks);
        }

        [HttpPost]
        public ActionResult Index(BookVM book)
        {
            BookVM newBooks = new BookVM();
            if (book.Title != null)
            {
                if (book.Author != null)
                {
                    if (book.Type != null)
                    {
                        newBooks.BooksDetails = dataService.GetBookByAll(book.Title, book.Type, book.Author);
                    }
                    else
                    {
                        newBooks.BooksDetails = dataService.GetBookByTiA(book.Title, book.Author);
                    }
                }
                else
                {
                    if (book.Type != null)
                    {
                        newBooks.BooksDetails = dataService.GetBookByTT(book.Title, book.Type);
                    }
                    else
                    {
                        newBooks.BooksDetails = dataService.GetBookByTitle(book.Title);
                    }
                }
            }
            else
            {
                if (book.Author != null)
                {
                    if (book.Type != null)
                    {
                        newBooks.BooksDetails = dataService.GetBookByTyA(book.Type, book.Author);
                    }
                    else
                    {
                        newBooks.BooksDetails = dataService.GetBookByAuthor(book.Author);
                    }
                }
                else
                {
                    if (book.Type != null)
                    {
                        newBooks.BooksDetails = dataService.GetBookByType(book.Type);
                    }
                    else
                    {
                        return Index();
                    }
                }
            }
            newBooks.Types = dataService.GetTypes();
            newBooks.Authors = dataService.GetAuthors();

            return View(newBooks);
        }

        public ActionResult BorrowDetails(int bookID)
        {
            ViewBag.Message = "Borrow Details Page.";
            BorrowsVM newBorrows = new BorrowsVM();
            newBorrows = dataService.GetBorrowDetails(bookID);

            return View(newBorrows);
        }

       [HttpGet]
        public ActionResult ViewStudents(int bookID)
        {
            ViewBag.Message = "Student Details Page.";
            StudentBookVM newStudents = new StudentBookVM();
            newStudents.Students = dataService.GetStudents(bookID);
            //newStudents.Books = dataService.GetBookDetails(bookID);
            BorrowsVM newVM = dataService.GetBorrowDetails(bookID);
            newStudents.BorrowDetails = newVM.BorrowsDetails;
            newStudents.Classes = dataService.GetClasses(bookID);
            newStudents.BookID = bookID;

            return View(newStudents);
        }

        [HttpPost]
        public ActionResult ViewStudents(StudentBookVM students)
        {
            ViewBag.Message = "Student Details Page.";
            StudentBookVM newStudents = new StudentBookVM();
            string type = students.Class;

            if (students.Name != null)
            {
                if (students.Class != null)
                {
                    newStudents.Students = dataService.GetStudentsByAll(students.BookID, students.Name, students.Class);
                }
                else
                {
                    newStudents.Students = dataService.GetStudentsByName(students.BookID, students.Name);
                }
            }
            else
            {
                if (students.Class != null)
                {
                    newStudents.Students = dataService.GetStudentsByClass(students.BookID, students.Class);
                }
                else
                {
                    return ViewStudents(students.BookID);
                }
            }

            BorrowsVM newVM = dataService.GetBorrowDetails(students.BookID);
            newStudents.BorrowDetails = newVM.BorrowsDetails;
            newStudents.Classes = dataService.GetClasses(students.BookID);
            newStudents.BookID = students.BookID;

            return View(newStudents);
        }

        public ActionResult BorrowBook(int bookID, int studentID)
        {
            ViewBag.Message = "Borrow Details Page.";
            dataService.BorrowBook(bookID, studentID);
            BorrowsVM newBorrows = new BorrowsVM();
            newBorrows = dataService.GetBorrowDetails(bookID);

            return View("BorrowDetails", newBorrows);
        }

        public ActionResult ReturnBook(int bookID)
        {
            ViewBag.Message = "Borrow Details Page.";
            dataService.ReturnBook(bookID);
            BorrowsVM newBorrows = new BorrowsVM();
            newBorrows = dataService.GetBorrowDetails(bookID);

            return View("BorrowDetails", newBorrows);
        }
    }
}