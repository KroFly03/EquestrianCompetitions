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
    /// Логика взаимодействия для CurrentRaceResultPage.xaml
    /// </summary>
    public partial class CurrentRaceResultPage : Page
    {
        int race;
        List<RaceScoreInfoView> score;
        public CurrentRaceResultPage(int race)
        {
            InitializeComponent();
            this.race = race;
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
    }
}
