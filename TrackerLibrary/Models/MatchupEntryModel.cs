using System;
using System.Collections.Generic;
using System.Text;

namespace TrackerLibrary.Models
{
    public class MatchupEntryModel
    {


        /// <summary>
        /// The uniqe identifier for the Matchup entry in database.
        /// </summary>

        public int Id { get; set; }
        /// <summary>
        /// Representation of one team in the matchup
        /// </summary>
        public TeamModel TeamCompeting { get; set; }

        /// <summary>
        /// Representation of the score for this particular team
        /// </summary>
        public double Score { get; set; }

        /// <summary>
        /// Representation the matchup that this team came
        /// </summary>
        public MatchupModel ParentMatchup { get; set; }
    }
}
