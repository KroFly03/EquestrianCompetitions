using EquestrianCompetitions.Classes;
using EquestrianCompetitions.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace EquestrianCompetitions.Pages
{
    /// <summary>
    /// Логика взаимодействия для JockeyHorseEditPage.xaml
    /// </summary>
    public partial class JockeyHorseEditPage : Page
    {
        Members currentMember = new Members();
        List<HorseInfoView> horses = EquestrianCompetitionsEntities.GetContext().HorseInfoView.ToList();
        public JockeyHorseEditPage(string login)
        {
            InitializeComponent();
            Name.ItemsSource = horses.Select(h => h.horse);
            var members = EquestrianCompetitionsEntities.GetContext().Members.ToList();
            int jockey = EquestrianCompetitionsEntities.GetContext().Jockeys.ToList().Where(j => j.login == login).Select(j => j.id).FirstOrDefault();
            var member = members.Where(m => m.jockey == jockey);
            if (member != null)
                currentMember = member.First();
            DataContext = currentMember;
        }

        private void Name_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            string currentHorse = Name.SelectedValue.ToString();
            if (currentHorse != null)
            {
                var horse = horses.Where(h => h.horse == currentHorse).SingleOrDefault();
                Age.Text = horse.age.ToString();
                Breed.Text = horse.breed;
                Coach.Text = horse.coach;
            }
        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.GoBack();
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
