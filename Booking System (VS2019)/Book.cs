using System;
using System.Collections.Generic;
using System.Web;

namespace BookingSystem
{
    public class Book
    {
        private int BookId;
        private string TittleAuthor;
        private bool Available;
        private DateTime RequestFrom;
        private DateTime RequestUpto;
        private Message message;


        public Book()
        {
            this.Message = new Message();
        }

        public int bookId
        {
            get { return BookId; }
            set { BookId = value; }
        }

        public string tittleAuthor
        {
            get { return TittleAuthor; }
            set { TittleAuthor = value; }
        }

        public bool available
        {
            get { return Available; }
            set { Available = value; }
        }

        public DateTime requestFrom
        {
            get { return RequestFrom; }
            set { RequestFrom = value; }
        }

        public DateTime requestUpto
        {
            get { return RequestUpto; }
            set { RequestUpto = value; }
        }

        public Message Message
        {
            get { return message; }
            set { message = value; }
        }

    }


    public class Message
    {
        private int errorCode;
        private string errorMessage;



        public Message()
        {
            this.ErrorCode = 0;
        }

        public int ErrorCode
        {
            get { return errorCode; }
            set { errorCode = value; }
        }

        public string ErrorMessage
        {
            get { return errorMessage; }
            set { errorMessage = value; }
        }

    }
}