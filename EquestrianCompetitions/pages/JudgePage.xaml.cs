using EquestrianCompetitions.Classes;
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
    /// Логика взаимодействия для JudgePage.xaml
    /// </summary>
    public partial class JudgePage : Page
    {
        public JudgePage()
        {
            InitializeComponent();
        }

        private void HorseInfoButton_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new HorseInfoPage());
        }

        private void JockeyInfoButton_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new JockeyInfoPage());
        }

        private void EditRaceResultButton_Click(object sender, RoutedEventArgs e)
        {

        }

        private void TrackAssignmentButton_Click(object sender, RoutedEventArgs e)
        {

        }

        private void MemberInfoButton_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new RaceMemberInfoPage());
        }

        private void RaceScoreInfoButton_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new RaceScoreInfoPage(0));
        }

        private void CompetitionReportButton_Click(object sender, RoutedEventArgs e)
        {

        }

        private void DisqualifiedEditButton_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new RaceScoreInfoPage(2));
        }
        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.GoBack();
        }
    }
}
