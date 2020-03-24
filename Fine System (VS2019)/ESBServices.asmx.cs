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


namespace ExternalSystem
{
    /// <summary>
    /// ESB demo to demostrate the BPM and SOA Integration
    /// </summary>
    [WebService(Namespace = "http://localhost:8080/FineSystem/ESBServices.asmx", Description = "Web service example that validates if an student has any outstanding fine. This webService is just an example used  to show how to invoke" +
    " WebServices from BizAgi Studio.")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ToolboxItem(false)]
    public class ESB : System.Web.Services.WebService
    {

        #region string Services

        /// <summary>
        /// XML WebService(example) verify if a Student with an specific code has a penalty in the system
        /// This webService is just an example used  to show how to invoke
        /// WebServices from BizAgi. 
        /// </summary>
        /// <returns></returns>
        [WebMethod(Description = "Returns a Fine Response with information related with the outstanding fine of the student")]
        public FineResponse OutstandingFine(Student student)
        {
            FineResponse FR = new FineResponse();
            bool res = false;
            if (student.code != null && student.code.EndsWith("1"))
            {
                res = true;
                Random rnd = new Random();
                int currentFine = 10 + rnd.Next(500); // creates a number between 100 and 510
                FR.OutstandingFine = res;
                FR.CurrentFine = currentFine;
            }

            else
            {
                res = false;
                FR.OutstandingFine = res;
                FR.CurrentFine = 0;
            }
           

            return FR;
        }


        #endregion


    }



    #region Objects to return
    //objects to use mapping wizard 

    public class Student
    {
        private string StudentName;
        private string Email;
        private string Code;
        private string Faculty;
        private string Phone;


        public string studentName
        {
            get { return StudentName; }
            set { StudentName = value; }
        }

        public string email
        {
            get { return Email; }
            set { Email = value; }
        }

        public string code
        {
            get { return Code; }
            set { Code = value; }
        }


        public string faculty
        {
            get { return Faculty; }
            set { Faculty = value; }
        }

        public string phone
        {
            get { return Phone; }
            set { Phone = value; }
        }

    }
   

     public class Message 
     {
         private int  errorCode;
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

     public class FineResponse
     {
         private bool  outstandingFine;
         private int currentFine;

         public bool OutstandingFine
         {
             get { return outstandingFine; }
             set { outstandingFine = value; }
         }

         public int CurrentFine
         {
             get { return currentFine; }
             set { currentFine = value; }
         }

     }
    #endregion

}
