using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using TrackerLibrary;
using TrackerLibrary.Models;

namespace TrackerUI
{
    public partial class CreateTeamForm : Form
    {


        private List<PersonModel> availableTeamMembers = new List<PersonModel>();
        private List<PersonModel> selectedTeamMembers = new List<PersonModel>();


        public CreateTeamForm()
        {
            InitializeComponent();

            // CreateSampleData();

            WireUpList();
        }

        private void CreateSampleData()
        {
            availableTeamMembers.Add(new PersonModel { FirstName = "Kacper", LastName = "Dybowski", EmailAdress = "kacper.dybowski@gmail.com" });
            availableTeamMembers.Add(new PersonModel { FirstName = "Wojtek", LastName = "Smith", EmailAdress = "wojtek.dybowski@gmail.com" });
            availableTeamMembers.Add(new PersonModel { FirstName = "Filip", LastName = "Jonson", EmailAdress = "filip.dybowski@gmail.com" });
            
            selectedTeamMembers.Add(new PersonModel { FirstName = "Pawel", LastName = "Gaweł", EmailAdress = "kacper.dybowski@gmail.com" });
            selectedTeamMembers.Add(new PersonModel { FirstName = "Ala", LastName = "Posh", EmailAdress = "wojtek.dybowski@gmail.com" });
            selectedTeamMembers.Add(new PersonModel { FirstName = "Victoria", LastName = "Gone", EmailAdress = "filip.dybowski@gmail.com" });
        }

        private void WireUpList()
        {
            selectTeamMemberDropDown.DataSource = availableTeamMembers;
            selectTeamMemberDropDown.DisplayMember = "FullName";

            teamMembersListBox.DataSource = selectedTeamMembers;
            teamMembersListBox.DisplayMember = "FullName";
        }


        private void createMemberButton_Click(object sender, EventArgs e)
        {
            if (ValidateForm())

            {
                PersonModel p = new PersonModel();
                p.FirstName = firstNameValue.Text;
                p.LastName = lastNameValue.Text;
                p.EmailAdress = emailValue.Text;
                p.CellphoneNumber = cellphoneValue.Text;

                GlobalConfig.Connection.CreatePerson(p);

                firstNameValue.Text = "";
                lastNameValue.Text = "";
                emailValue.Text = "";
                cellphoneValue.Text = "";
            }
            else
            {
                MessageBox.Show("You need to fill in all of the fields");
            }
        }
        private bool ValidateForm()
        {
            if(firstNameValue.Text.Length==0)
            {
                return false;
            }

            if (lastNameValue.Text.Length == 0)
            {
                return false;
            }

            if (emailValue.Text.Length == 0)
            {
                return false;
            }
           
            if (cellphoneValue.Text.Length == 0)
            {
                return false;
            }

            return true;
        }
    }
}
