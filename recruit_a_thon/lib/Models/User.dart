class User
{
  String Id;
  String Email;
  String Experience;
  String Image;
  String Phone;
  String Role;
  String Name;
  String Password;
  var Certificates;
  var Projects;
  var Skills;
  var Locations;

  User();

  User1(String Id, String Email, String Experience, String Image, String Phone, String Role,String Name,String Password, var Certificates, var Projects, var Skills, var Locations )
  {
    this.Id = Id;
    this.Email = Email;
    this.Experience = Experience;
    this.Image = Image;
    this.Phone = Phone;
    this.Role = Role;
    this.Name = Name;
    this.Certificates = Certificates;
    this.Projects = Projects;
    this.Skills = Skills;
    this.Locations = Locations;
  }

}