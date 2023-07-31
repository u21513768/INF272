﻿using System.Collections.Generic;

// DO NOT EDIT THIS FILE !!!!!!
// ----------------------------

namespace INF272SemesterTest2SectionB.Models
    {
    public class BookData
        {
        public static readonly List<BookType> BookTypes = new List<BookType>
        {
            new BookType{BookTypeID = 1, BookTypeDescription = "Action and Adventure"},
            new BookType{BookTypeID = 2, BookTypeDescription = "Classics"},
            new BookType{BookTypeID = 3, BookTypeDescription = "Detective and Mystery"},
            new BookType{BookTypeID = 4, BookTypeDescription = "Fantasy"},
            new BookType{BookTypeID = 5, BookTypeDescription = "Historical Fiction"},
        };

        public static readonly List<Author> Authors = new List<Author>
        {
            //---
            new Author{ AuthorID = 1, AuthorLastName = "Herbert", AuthorFirstName = "Frank", Ratings = new List<Book>
                {
                new Book { BookID = 1, AuthorID = 1, BookTypeID = 1, Rating = 4.25, BookName = "Dune"},
                new Book { BookID = 2, AuthorID = 1, BookTypeID = 1, Rating = 4.36, BookName = "The Great Dune Trilogy"},
                new Book { BookID = 3, AuthorID = 1, BookTypeID = 1, Rating = 3.82, BookName = "The Dosadi Experiment"}
                }
                },
            //---
            new Author{ AuthorID = 2, AuthorLastName = "Austen", AuthorFirstName = "Jane", Ratings = new List<Book>
                {
                new Book { BookID = 4, AuthorID = 2, BookTypeID = 2, Rating = 4.28, BookName = "Pride and Prejudice"},
                new Book { BookID = 5, AuthorID = 2, BookTypeID = 2, Rating = 4.08, BookName = "Sense and Sensibility"},
                new Book { BookID = 6, AuthorID = 2, BookTypeID = 2, Rating = 3.86, BookName = "Mansfield Park"}
                }
                },
            //---
            new Author{ AuthorID = 3, AuthorLastName = "Melville", AuthorFirstName = "Herman", Ratings = new List<Book>
                {
                new Book { BookID = 7, AuthorID = 3, BookTypeID = 2, Rating = 3.53, BookName = "Moby-Dick or, the Whale"},
                new Book { BookID = 8, AuthorID = 3, BookTypeID = 2, Rating = 3.93, BookName = "Bartleby the Scrivener"}
                }
                },
            //---
            new Author{ AuthorID = 4, AuthorLastName = "Christie", AuthorFirstName = "Agatha", Ratings = new List<Book>
                {
                new Book { BookID = 9, AuthorID = 4, BookTypeID = 3, Rating = 4.95, BookName = "Come Tell How Live"},
                new Book { BookID = 10, AuthorID = 4, BookTypeID = 3, Rating = 4.87, BookName = "Ordeal by Innocence"}
                }
                },
            //---
            new Author{ AuthorID = 5, AuthorLastName = "Doyle", AuthorFirstName = "Arthur Conan", Ratings = new List<Book>
                {
                new Book { BookID = 11, AuthorID = 5, BookTypeID = 3, Rating = 4.13, BookName = "The Hound of the Baskervilles"},
                new Book { BookID = 12, AuthorID = 5, BookTypeID = 3, Rating = 4.14, BookName = "A Study in Scarle"},
                new Book { BookID = 13, AuthorID = 5, BookTypeID = 3, Rating = 4.39, BookName = "The Adventures of Sherlock Holmes"},
                new Book { BookID = 14, AuthorID = 5, BookTypeID = 3, Rating = 4.24, BookName = "Return of Sherlock Holmes"}
                }
                },
            //---
            new Author{ AuthorID = 6, AuthorLastName = "Martin", AuthorFirstName = "George R. R.", Ratings = new List<Book>
                {
                new Book { BookID = 15, AuthorID = 6, BookTypeID = 4, Rating = 4.25, BookName = "Fire & Blood"},
                new Book { BookID = 16, AuthorID = 6, BookTypeID = 4, Rating = 3.38, BookName = "A Game of Thrones"},
                new Book { BookID = 17, AuthorID = 6, BookTypeID = 4, Rating = 4.03, BookName = "A Clash of Kings"},
                new Book { BookID = 18, AuthorID = 6, BookTypeID = 4, Rating = 3.23, BookName = "A Storm of Swords"},
                new Book { BookID = 19, AuthorID = 6, BookTypeID = 4, Rating = 4.01, BookName = "A Dance with Dragons"},
                new Book { BookID = 20, AuthorID = 6, BookTypeID = 4, Rating = 3.39, BookName = "A Feast for Crows"},
                new Book { BookID = 21, AuthorID = 6, BookTypeID = 4, Rating = 3.82, BookName = "A Knight of the Seven Kingdoms"}
                }
                },
            //---
            new Author{ AuthorID = 7, AuthorLastName = "Allende", AuthorFirstName = "Isabel", Ratings = new List<Book>
                {
                new Book { BookID = 22, AuthorID = 7, BookTypeID = 5, Rating = 4.01, BookName = "Paula"},
                new Book { BookID = 23, AuthorID = 7, BookTypeID = 5, Rating = 3.45, BookName = "Aphrodite: A Memoir of the Senses"},
                new Book { BookID = 24, AuthorID = 7, BookTypeID = 5, Rating = 4.23, BookName = "My Invented Country: A Memoir"},
                new Book { BookID = 25, AuthorID = 7, BookTypeID = 5, Rating = 3.23, BookName = "The Sum of Our Days"}
                }
                },
        };
        }
    }

// DO NOT EDIT THIS FILE !!!!!!
// ----------------------------