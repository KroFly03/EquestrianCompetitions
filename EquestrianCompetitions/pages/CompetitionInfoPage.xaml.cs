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
    /// Логика взаимодействия для CompetitionInfoPage.xaml
    /// </summary>
    public partial class CompetitionInfoPage : Page
    {
        List<CompetitionInfoView> competitions;
        public CompetitionInfoPage()
        {
            InitializeComponent();
        }
        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            competitions = EquestrianCompetitionsMainEntities1.GetContext().CompetitionInfoView.ToList();
            CompetitionsInfo.ItemsSource = competitions.Where(c => c.date >= DateTime.Now);
        }
        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.GoBack();
        }

        private void InfoButton_Click(object sender, RoutedEventArgs e)
        {
            int count = 1;
            var info = new StringBuilder();
            info.AppendLine("Ожидаемые заезды:");
            CompetitionInfoView competition = (sender as Button).DataContext as CompetitionInfoView;
            var races = EquestrianCompetitionsMainEntities1.GetContext().RaceScoreInfoView.ToList().Where(r => r.competition.Equals(competition.id));
            var currentRaces = races.Select(r => r.distance).Distinct();
            foreach (var race in currentRaces)
            {
                info.AppendLine($"{count}: {race}");
                count++;
            }
            MessageBox.Show(info.ToString());
        }
    }
}
