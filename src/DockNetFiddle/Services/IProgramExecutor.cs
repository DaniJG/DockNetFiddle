using DockNetFiddle.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DockNetFiddle.Services
{
    public interface IProgramExecutor
    {
        string Execute(ProgramSpecification program);
    }
}
