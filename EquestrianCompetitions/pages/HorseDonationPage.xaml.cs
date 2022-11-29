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
    /// Логика взаимодействия для HorseDonationPage.xaml
    /// </summary>
    public partial class HorseDonationPage : Page
    {
        public HorseDonationPage()
        {
            InitializeComponent();
        }
        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            var horses = EquestrianCompetitionsEntities.GetContext().HorseInfoView.ToList().Select(h => h.id);
            foreach (var horse in horses)
            {
                HorseList.Items.Add(horse);
            }
        }
        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.GoBack();
        }

        private void ConfirmButton_Click(object sender, RoutedEventArgs e)
        {
            if (HorseList.Text != "" && DonationAmount.Text != "" && Card.Text != "" && MonthCardDuration.Text != "" && 
                YearCardDuration.Text != "" && UserName.Text != "" && CardCode.Password != "")
            {
                MessageBox.Show("Благодарим Вас за пожертвование!");
                HorseList.Text = "";
                DonationAmount.Text = "";
                Card.Text = "";
                MonthCardDuration.Text = "";
                YearCardDuration.Text = "";
                UserName.Text = "";
                CardCode.Password = "";
            }
            else
            {
                MessageBox.Show("Заполните все поля");
            }
        }

        private void DonationAmount_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (!Char.IsDigit(e.Text, 0))
            {
                e.Handled = true;
            }
        }

        private void Card_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (!Char.IsDigit(e.Text, 0))
            {
                e.Handled = true;
            }
        }

        private void MonthCardDuration_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (!Char.IsDigit(e.Text, 0))
            {
                e.Handled = true;
            }
        }

        private void YearCardDuration_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (!Char.IsDigit(e.Text, 0))
            {
                e.Handled = true;
            }
        }

        private void UserName_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (Char.IsDigit(e.Text, 0))
            {
                e.Handled = true;
            }
        }

        private void CardCode_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (!Char.IsDigit(e.Text, 0))
            {
                e.Handled = true;
            }
        }
    }
}
