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
    /// Логика взаимодействия для JockeyInfoPage.xaml
    /// </summary>
    public partial class JockeyInfoPage : Page
    {
        public JockeyInfoPage()
        {
            InitializeComponent();
        }
        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            var jockeys = EquestrianCompetitionsEntities.GetContext().JockeyInfoView.ToList();
            JockeysInfo.ItemsSource = jockeys;
        }
        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.GoBack();
        }
    }
}
