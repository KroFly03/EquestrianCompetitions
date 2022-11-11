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
    /// Логика взаимодействия для RaceScoreInfoPage.xaml
    /// </summary>
    public partial class RaceScoreInfoPage : Page
    {
        List<RaceView> races;
        public RaceScoreInfoPage()
        {
            InitializeComponent();
        }
        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            races = EquestrianCompetitionsMainEntities1.GetContext().RaceView.ToList();
            RaceMemberInfo.ItemsSource = races;
        }
        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.GoBack();
        }
        private void InfoButton_Click(object sender, RoutedEventArgs e)
        {
            RaceView currentRaces = (sender as Button).DataContext as RaceView;
            Manager.MainFrame.Navigate(new CurrentRaceResultPage(currentRaces.race));
        }
    }
}
