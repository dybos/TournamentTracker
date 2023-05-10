﻿using System;
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
        /// The uniqe identifier for the person in database.
        /// </summary>

        public int Id { get; set; }
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
        public string EmailAddress { get; set; }

        /// <summary>
        /// The primary cellphone number of the person.
        /// </summary>
        public string CellphoneNumber { get; set; }

        public string FullName
        {
            get { return $"{FirstName} {LastName}"; }

        }


    }
}
