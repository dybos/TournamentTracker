﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Text;
using TrackerLibrary.DataAccess;

namespace TrackerLibrary
{
    public static class GlobalConfig
    {

        public const string PrizesFile = "PrizeModels.csv";
        public const string PeopleFile = "PersonModels.csv";
        public const string TeamFile = "TeamModels.csv";
        public const string TournamentFile = "TournamentModels,csv";
        public const string MatchupFile = "MatchupModels.csv";
        public const string MatchupEntryFile = "MatchupEntryModels.csv";

        public static IDataConnection Connection { get; private set; }


        
        public static void InitializeConnections(DatabaseType db)
        {
            
            if (db == DatabaseType.Sql)
            {
                //Set up the SQL Connector properly
                SqlConnector sql = new SqlConnector();
                Connection=sql;
            }

            else if(db == DatabaseType.TextFile)
            {
                //Create text connection
                TextConnector text = new TextConnector();
                Connection=text;
            }
        }

        public static string CnnString(string name)
        {
            //TODO Need to handle with this error - dunno why, after changing the App.config - I added the system.net section with mailSetting - app is blowing up right here, when we are trying to connect with database.
            // When I deleted section system.net in App.config, app started to working - have to repair the issue with system.net - few ideas after checking stackoverflow.
            return ConfigurationManager.ConnectionStrings[name].ConnectionString;
        }

        public static string AppKeyLookup(string key)
        {
            return ConfigurationManager.AppSettings[key];
        }
    }
}
