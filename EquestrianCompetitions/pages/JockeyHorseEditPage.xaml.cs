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
    /// Логика взаимодействия для JockeyHorseEditPage.xaml
    /// </summary>
    public partial class JockeyHorseEditPage : Page
    {
        List<HorseInfoView> horses = EquestrianCompetitionsEntities.GetContext().HorseInfoView.ToList();
        List<Coaches> coaches = EquestrianCompetitionsEntities.GetContext().Coaches.ToList();
        string login;
        static int horseId;
        public JockeyHorseEditPage(string login)
        {
            InitializeComponent();
            this.login = login;
        }

        private void Name_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            string currentHorse = Name.SelectedValue.ToString();
            if (currentHorse != null)
            {
                var horse = horses.Where(h => h.horse == currentHorse).SingleOrDefault();
                horseId = horse.id;
                Age.Text = horse.age.ToString();
                Breed.Text = horse.breed;
                Coach.Text = horse.coach;
            }
        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.GoBack();
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            int breed = EquestrianCompetitionsEntities.GetContext().Breeds.ToList().Where(b => b.name == Breed.Text).Select(b => b.id).SingleOrDefault();
            int coach = EquestrianCompetitionsEntities.GetContext().Coaches.ToList().Where(c => c.fio == Coach.Text).Select(c => c.id).SingleOrDefault();
            var horse = EquestrianCompetitionsEntities.GetContext().Horses.ToList().Where(h => h.id == horseId).SingleOrDefault();
            horse.name = Name.Text;
            horse.breed = breed;
            horse.coach = coach;
            horse.age = Convert.ToInt32(Age.Text);
            try
            {
                EquestrianCompetitionsEntities.GetContext().SaveChanges();
                MessageBox.Show("Информация успешно сохранена");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            Name.ItemsSource = horses.Select(h => h.horse);
            Coach.ItemsSource = coaches.Select(c => c.fio);
        }
    }
}
