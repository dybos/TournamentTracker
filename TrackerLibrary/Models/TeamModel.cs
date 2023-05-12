using System;
using System.Collections.Generic;
using System.Text;

namespace TrackerLibrary.Models
{
    /// <summary>
    /// Represent one team.
    /// </summary>
    public class TeamModel
    {


        /// <summary>
        /// The uniqe identifier for the Team in database.
        /// </summary>
        public int Id { get; set; }
        /// <summary>
        /// Represent the name of the team.
        /// </summary>
        public string TeamName { get; set; }

        /// <summary>
        /// Represents members of one team.
        /// </summary>
        public List<PersonModel> TeamMembers { get; set; } = new List<PersonModel>();


    }

}
