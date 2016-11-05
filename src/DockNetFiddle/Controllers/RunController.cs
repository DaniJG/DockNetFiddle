using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using DockNetFiddle.Models;
using DockNetFiddle.Services;

namespace DockNetFiddle.Controllers
{
    public class RunController : Controller
    {
        private IProgramExecutor executorService;
        public RunController(IProgramExecutor executorService)
        {
            this.executorService = executorService;
        }

        [HttpPost]
        public IActionResult Index([FromBody]ProgramSpecification model)
        {
            if (!ModelState.IsValid) return StatusCode(400);

            return Json(new {
                result = executorService.Execute(model)
            });
        }
    }
}
