using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace DockNetFiddle.Models
{
    public class ProgramSpecification
    {
        [Required]
        public string Program { get; set; }

        public string Project { get; set; }

        #region defaultProgram
        private static string DefaultProgram = 
@"using System;
namespace ConsoleApplication
{
    public class Program
    {
        public static void Main(string[] args)
        {
            Console.WriteLine(""Hello World!"");
        }
    }
}";

        private static string DefaultProject = 
@"<Project Sdk=""Microsoft.NET.Sdk"">

  <PropertyGroup>
    <OutputType>Exe</OutputType>
    <TargetFramework>netcoreapp1.0</TargetFramework>
  </PropertyGroup>

</Project>
";
        public static ProgramSpecification Default = new ProgramSpecification
        {
            Program = ProgramSpecification.DefaultProgram,
            Project = ProgramSpecification.DefaultProject
        };
        #endregion
    }
}
