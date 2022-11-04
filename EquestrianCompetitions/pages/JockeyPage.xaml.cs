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
    /// Логика взаимодействия для JockeyPage.xaml
    /// </summary>
    public partial class JockeyPage : Page
    {
        string login;
        public JockeyPage(string login)
        {
            InitializeComponent();
            this.login = login;
        }

        private void HorseInfoButton_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new HorseInfoPage());
        }

        private void JockeyInfoButton_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new JockeyInfoPage());
        }

        private void RaceRegistrationButton_Click(object sender, RoutedEventArgs e)
        {

        }

        private void HorseEditButton_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new JockeyHorseEditPage(login));
        }

        private void RaceScoreInfoButton_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new RaceScoreInfoPage());
        }

        private void MemberInfoButton_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new RaceMemberInfoPage());
        }

        private void JockeyEditButton_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new JockeyEditPage(login));
        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.GoBack();
        }
    }
}
