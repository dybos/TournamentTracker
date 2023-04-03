using System;
using System.Collections.Generic;
using System.Text;

namespace TrackerLibrary
{
    /// <summary>
    /// Represents the prizing model for tournament.
    /// </summary>
    public class PrizeModel
    {   
        /// <summary>
        /// Represenst which place in the tournament is connect with particular prize
        /// </summary>
        public int PlaceNumber { get; set; }

        /// <summary>
        /// Represents the name of the place eg. "winner" for first place etc.
        /// </summary>
        public string PlaceName { get; set; }

        /// <summary>
        /// Represent the prize amount.
        /// </summary>
        public decimal PrizeAmount { get; set; }

        /// <summary>
        /// Represent the percentage of prize amount if needed.
        /// </summary>
        public double PrizePercentage { get; set; }
    }
}
