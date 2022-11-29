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
    /// Логика взаимодействия для AuthorizationPage.xaml
    /// </summary>
    public partial class AuthorizationPage : Page
    {
        List<UserView> users;
        public AuthorizationPage()
        {
            InitializeComponent();
        }
        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            users = EquestrianCompetitionsEntities.GetContext().UserView.ToList();
        }
        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.GoBack();
        }

        private void LoginButton_Click(object sender, RoutedEventArgs e)
        {
            var user = EquestrianCompetitionsEntities.GetContext().Users.ToList().Where(u => u.login == LoginInput.Text && u.password == PasswordInput.Password).SingleOrDefault();
            if (user != null)
            {
                MessageBox.Show("Авторизация прошла успаешно");
                switch (user.role)
                {
                    case 1:
                        Manager.MainFrame.Navigate(new JockeyPage(user.login));
                        break;
                    case 2:
                        Manager.MainFrame.Navigate(new JudgePage());
                        break;
                }
            }
            else
                MessageBox.Show("Неверные данные");
        }
        private void FanMenuButton_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new FanPage());
        }
    }
}
