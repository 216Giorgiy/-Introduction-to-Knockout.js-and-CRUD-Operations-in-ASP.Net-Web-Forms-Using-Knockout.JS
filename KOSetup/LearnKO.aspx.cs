using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KOSetup
{
    public partial class LearnKO : System.Web.UI.Page
    {
        /// <summary>
        /// Page Load Method
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        #region Public Web Methods.
        /// <summary>
        /// Gets Student Details
        /// </summary>
        /// <returns></returns>
        [WebMethod]
        public static Student[] FetchStudents()
        {
            LearningKOEntities dbEntities = new LearningKOEntities();
            var data = (from item in dbEntities.Students
                        orderby item.StudentId
                        select item).Take(5);
            return data.ToArray();
        }

        /// <summary>
        /// Saves Student Details
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [WebMethod]
        public static string SaveStudent(Student[] data)
        {
            try
            {
                var dbContext = new LearningKOEntities();
                var studentList = from dbStududent in dbContext.Students select dbStududent;
                foreach (Student userDetails in data)
                {
                    var student = new Student();
                    if (userDetails != null)
                    {
                        student.StudentId = userDetails.StudentId;
                        student.FirstName = userDetails.FirstName;
                        student.LastName = userDetails.LastName;
                        student.Address = userDetails.Address;
                        student.Age = userDetails.Age;
                        student.Gender = userDetails.Gender;
                        student.Batch = userDetails.Batch;
                        student.Class = userDetails.Class;
                        student.School = userDetails.School;
                        student.Domicile = userDetails.Domicile;
                    }
                    Student stud=(from st in studentList where st.StudentId==student.StudentId select st).FirstOrDefault();
                    if (stud == null)
                        dbContext.Students.Add(student);
                    dbContext.SaveChanges();
                }
                return "Data saved to database!";
            }
            catch (Exception ex)
            {
                return "Error: " + ex.Message;
            }
        }

        /// <summary>
        /// Deletes Student Details
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [WebMethod]
        public static string DeleteStudent(Student data)
        {
            try
            {
                var dbContext = new LearningKOEntities();
                var student = dbContext.Students.FirstOrDefault(userId => userId.StudentId == data.StudentId);
                if (student != null)
                {
                    if (student != null)
                    {
                        dbContext.Students.Remove(student);
                        dbContext.SaveChanges();
                    }
                }
                return "Data deleted from database!";

            }
            catch (Exception ex)
            {
                return "Error: " + ex.Message;
            }
        }
        #endregion
    }
}