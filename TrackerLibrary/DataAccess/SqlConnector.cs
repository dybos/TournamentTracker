using System;
using System.Collections.Generic;
using System.Text;
using TrackerLibrary.Models;

namespace TrackerLibrary.DataAccess
{
    public class SqlConnector : IDataConnection
    {
    // TODO - Make the CreatePrizeMethos actually save to the database.

    /// <summary>
    /// Saves a new prize to the database
    /// </summary>
    /// <param name="model">The prize information</param>
    /// <returns>The prize information, including the uniqe identifier.</returns>
        public PrizeModel CreatePrize(PrizeModel model)
        {
            model.Id = 1;
           
            return model;
        }
    }
}
