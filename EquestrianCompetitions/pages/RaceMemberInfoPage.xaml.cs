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
    /// Логика взаимодействия для RaceMemberInfoPage.xaml
    /// </summary>
    public partial class RaceMemberInfoPage : Page
    {
        List<MemberInfoView> members;
        public RaceMemberInfoPage()
        {
            InitializeComponent();
        }
        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            Race.IsEnabled = false;
            members = EquestrianCompetitionsEntities.GetContext().MemberInfoView.ToList();
            RaceMemberInfo.ItemsSource = members;
            Competition.ItemsSource = members.Select(m => m.date).OrderBy(m => m).Distinct();
            Race.ItemsSource = members.Select(m => m.distance).OrderBy(m => m).Distinct();
        }
        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.GoBack();
        }

        private void Competition_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if(Competition.SelectedValue != null)
            {
                Race.IsEnabled = true;
                RaceMemberInfo.ItemsSource = members.Where(m => m.date.Equals(Competition.SelectedValue));
            }
        }
        private void Race_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if(Race.SelectedValue != null)
            {
                RaceMemberInfo.ItemsSource = members.Where(m => m.date.Equals(Competition.SelectedValue) && m.distance.Equals(Race.SelectedValue));
            }
        }
        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            Race.IsEnabled = false;
            RaceMemberInfo.ItemsSource = members;
            Competition.Text = null;
            Race.Text = null;
        }
    }
}
