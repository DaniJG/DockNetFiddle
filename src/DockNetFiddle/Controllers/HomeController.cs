using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using DockNetFiddle.Models;

namespace DockNetFiddle.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View(ProgramSpecification.Default);
        }
        
        public IActionResult Error()
        {
            return View();
        }
    }
}