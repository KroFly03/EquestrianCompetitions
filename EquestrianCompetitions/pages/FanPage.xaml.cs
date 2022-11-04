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
    /// Логика взаимодействия для FanPage.xaml
    /// </summary>
    public partial class FanPage : Page
    {
        public FanPage()
        {
            InitializeComponent();
        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.GoBack();
        }

        private void HorseInfoButton_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new HorseInfoPage());
        }

        private void JockeyInfoButton_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new JockeyInfoPage());
        }

        private void CompetitionInfoButton_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new CompetitionInfoPage());
        }

        private void MemberInfoButton_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new RaceMemberInfoPage());
        }

        private void RaceScoreInfoButton_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new RaceScoreInfoPage());
        }

        private void DonateButton_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new HorseDonationPage());
        }
    }
}
