using System;
using System.Data;
using System.Web;
using System.Collections;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.ComponentModel;
using System.Xml;
using BizAgi.Defs;
using System.Collections.Generic;




namespace BookingSystem
{
    /// <summary>
    /// ESB demo to demostrate the BPM and SOA Integration
    /// </summary>
    [WebService(Namespace = "http://localhost:8080/BookingSystem/Service.asmx", Description = "Web service example that validates if a set of books is available or not. This webService is just an example used  to show how to invoke" +
    " WebServices from BizAgi Studio.")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ToolboxItem(false)]
    public class Service : System.Web.Services.WebService
    {

        #region string Services

        /// <summary>
        /// XML WebService(example) that validates if a set of books is available or not
        /// This webService is just an example used  to show how to invoke
        /// WebServices from BizAgi. 
        /// </summary>
        /// <returns></returns>
        [WebMethod(Description = "Returns a list of books with information related with the availability ")]
        public List<Book> verifyBookAvailability(List<Book> books)
        {
            var BooksAvailability = new List<Book>();
            var BookRequested = new Book();

            if (books.Count > 1)
            {
                Random rnd = new Random();
                for (int i = 0; i < books.Count; i++)
                {
                    BookRequested = books[i];
                    int bookAvailable = 1 + rnd.Next(10); // creates a number between 1 and 10

                    if (bookAvailable < 5)
                    {
                        BookRequested.available = true;
                    }

                   else
                   {
                        BookRequested.available = false;
                   }

                    BooksAvailability.Add(BookRequested);
                }

            }

            else
            {
                BookRequested.Message.ErrorCode = 1;
                BookRequested.Message.ErrorMessage = "Error validating the books availability";
            }

            return BooksAvailability;
        }


        #endregion


    }

}
