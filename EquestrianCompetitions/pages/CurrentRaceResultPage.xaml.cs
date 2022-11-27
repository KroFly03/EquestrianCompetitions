using EquestrianCompetitions.Classes;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
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
    /// Логика взаимодействия для CurrentRaceResultPage.xaml
    /// </summary>
    public partial class CurrentRaceResultPage : Page
    {
        int race, role;
        List<RaceScoreInfoView> score;
        public CurrentRaceResultPage(int race, int role)
        {
            InitializeComponent();
            this.race = race;
            this.role = role;
        }
        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            score = EquestrianCompetitionsEntities.GetContext().RaceScoreInfoView.ToList();
            ScoreInfo.ItemsSource = score.Where(s => s.race.Equals(race));
        }
        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.GoBack();
        }

        private void DisqualifiedButton_Click(object sender, RoutedEventArgs e)
        {
            if(role == 2)
            {
                RaceScoreInfoView currMember = (sender as Button).DataContext as RaceScoreInfoView;
                Disqualifications disq = EquestrianCompetitionsEntities.GetContext().Disqualifications.ToList().Where(d => d.id == currMember.disqualification).SingleOrDefault();
                if (disq.status)
                    disq.status = false;
                else
                    disq.status = true;

                try
                {
                    EquestrianCompetitionsEntities.GetContext().SaveChanges();
                    Window_Loaded(sender, e);
                }
                catch (SqlException ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
            else
            {
                MessageBox.Show("Изменять статус дисквалификации может только судья");
            }
        }
    }
}
