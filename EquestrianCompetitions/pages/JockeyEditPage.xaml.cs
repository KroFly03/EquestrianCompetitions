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
    /// Логика взаимодействия для JockeyEditPage.xaml
    /// </summary>
    public partial class JockeyEditPage : Page
    {
        Jockeys currentJockey = new Jockeys();
        public JockeyEditPage(string login)
        {
            InitializeComponent();
            var jockeys = EquestrianCompetitionsEntities.GetContext().Jockeys.ToList();
            var jockey = jockeys.Where(j => j.login == login).ToList();
            if (jockey != null)
                currentJockey = jockey.First();
            DataContext = currentJockey;
        }
        private void Window_Loaded(object sender, RoutedEventArgs e)
        {

        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.GoBack();
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            if (currentJockey.id == 0)
            {
                EquestrianCompetitionsEntities.GetContext().Jockeys.Add(currentJockey);
            }
            try
            {
                EquestrianCompetitionsEntities.GetContext().SaveChanges();
                MessageBox.Show("Информация сохранена");
                Manager.MainFrame.GoBack();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
