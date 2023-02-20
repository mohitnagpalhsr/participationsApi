Packages to be installed for running this project

dotnet add package Microsoft.EntityFrameworkCore.Tools
dotnet add package Microsoft.EntityFrameworkCore.SqlServer

and install the below in startup project in case of multiple projects in a solution

dotnet add package Microsoft.EntityFrameworkCore.Design

extra commands for adding and executing migarations

dotnet tool install --global dotnet-ef
dotnet add package Microsoft.EntityFrameworkCore.Design
dotnet ef migrations add InitialCreate
dotnet ef database update


dotnet ef dbcontext scaffold "Server=.\sqlexpress;Database=SportsEventManagement;TrustServerCertificate=Yes;Trusted_Connection=True;" Microsoft.EntityFrameworkCore.SqlServer -o Models