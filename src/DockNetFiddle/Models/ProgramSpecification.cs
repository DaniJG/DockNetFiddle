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

        public string ProjectJSON { get; set; }

        #region defaultProgram
        private static string DefaultProgram = @"using System;
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

        private static string DefaultProjectJSON = @"{
  ""version"": ""1.0.0-*"",
  ""buildOptions"": {
    ""debugType"": ""portable"",
    ""emitEntryPoint"": true
  },
  ""dependencies"": {},
  ""frameworks"": {
    ""netcoreapp1.0"": {
      ""dependencies"": {
        ""Microsoft.NETCore.App"": {
          ""type"": ""platform"",
          ""version"": ""1.0.1""
        }
      },
      ""imports"": ""dnxcore50""
    }
  }
}";
        public static ProgramSpecification Default = new ProgramSpecification
        {
            Program = ProgramSpecification.DefaultProgram,
            ProjectJSON = ProgramSpecification.DefaultProjectJSON
        };
        #endregion
    }
}
