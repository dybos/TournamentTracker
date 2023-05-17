using System;
using System.Collections.Generic;
using System.Text;
using TrackerLibrary.Models;

namespace TrackerLibrary
{
    public static class TournamentLogic
    {
        // TODO wire our matchups
        // Order our list randomly of team
        // check if it is big enough - if not, add in byes
        // figure out n for 2^n teams
        //Create our first round of matchups
        //Creave every round after that

        public static void CreateRounds(TournamentModel model)
        {
            List<TeamModel> randomizedTeams = RandomizeTeamOrder(model.EnteredTeams);
        }

        private static List<TeamModel> RandomizeTeamOrder(List<TeamModel> teams)
        {

        }
    }
}
