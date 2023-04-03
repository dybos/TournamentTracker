using System;
using System.Collections.Generic;
using System.Text;

namespace TrackerLibrary
{
    /// <summary>
    /// Represent one team.
    /// </summary>
    public class TeamModel
    {

        /// <summary>
        /// Represents members of one team.
        /// </summary>
        public List<PersonModel> TeamMembers { get; set; } = new List<PersonModel>();

        /// <summary>
        /// Represent the name of the team.
        /// </summary>
        public string TeamName { get; set; }

    }

}
