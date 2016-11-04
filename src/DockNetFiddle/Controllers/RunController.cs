using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using DockNetFiddle.Models;

namespace DockNetFiddle.Controllers
{
    public class RunController : Controller
    {
        [HttpPost]
        public IActionResult Index([FromBody]ProgramSpecification model)
        {
            if (!ModelState.IsValid) return StatusCode(400);

            return Json(new { result = "Hello World!" });
        }
    }
}
