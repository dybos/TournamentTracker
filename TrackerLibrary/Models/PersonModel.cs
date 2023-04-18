using System;
using System.Collections.Generic;
using System.Text;

namespace TrackerLibrary.Models
{

    /// <summary>
    /// Represents one person. 
    /// </summary>
    public class PersonModel
    {

        /// <summary>
        /// The first name of the person.
        /// </summary>
        /// 
        public string FirstName { get; set; }
        /// <summary>
        /// The last name of the person.
        /// </summary>
        public string LastName { get; set; }

        /// <summary>
        /// The primary email address of the person.
        /// </summary>
        public string EmailAdress { get; set; }

        /// <summary>
        /// The primary cellphone number of the person.
        /// </summary>
        public string CellPhoneNumber { get; set; }

    }
}
