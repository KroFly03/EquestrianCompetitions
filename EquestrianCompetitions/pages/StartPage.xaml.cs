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
    /// Логика взаимодействия для StartPage.xaml
    /// </summary>
    public partial class StartPage : Page
    {
        public StartPage()
        {
            InitializeComponent();
        }
        private void ExitButton_Click(object sender, RoutedEventArgs e)
        {
            var response = MessageBox.Show("Вы точно хотите выйти", "Выход", MessageBoxButton.YesNo, MessageBoxImage.Exclamation);
            if (response != MessageBoxResult.No)
            {
                Application.Current.Shutdown();
            }
        }
        private void StartButton_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new AuthorizationPage());
        }

        private void InformationButton_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("Компания «Русский тяжеловоз» занимается организацией конных состязаний на принадлежащем ей ипподроме." +
                "Ипподромные испытания на протяжении всей истории разведения рысаков и верховых лошадей" +
                " в России являются основным методом отбора производителей, а следовательно" +
                " – методом совершенствования конских пород.Благодаря им, из поколения в поколение" +
                " в лошадях накапливаются положительные рабочие качества: сила, выносливость, резвость.");
        }
    }
}
