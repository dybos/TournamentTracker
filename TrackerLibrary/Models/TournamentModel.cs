using System;
using System.Collections.Generic;
using System.Text;

namespace TrackerLibrary.Models
{

    /// <summary>
    /// Represent one specific tournament
    /// </summary>
    public class TournamentModel
    {

        /// <summary>
        /// The uniqe identifier for the Tournament in database.
        /// </summary>

        public int Id { get; set; }

        /// <summary>
        /// Represent the name of the tournament/
        /// </summary>
        public string TournamentName { get; set; }

        /// <summary>
        /// Represent the entry fee for tournament.
        /// </summary>
        public decimal EntryFee { get; set; }
        /// <summary>
        /// Represent teams which are involved in the tournament
        /// </summary>
        public List<TeamModel> EnteredTeams { get; set; } = new List<TeamModel>();
        /// <summary>
        /// Represent the prizing model for tournament
        /// </summary>
        public List<PrizeModel> Prizes { get; set; } = new List<PrizeModel>();

        /// <summary>
        /// Represent the match up model for the tournament.
        /// </summary>
        public List<List<MatchupModel>> Rounds { get; set; } = new List<List<MatchupModel>>();
    }
}
