using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Prescribing_System.Models;
using Prescribing_System.Areas.Admin.Models;
using Prescribing_System.Areas.Admin.Models.System_Users;

namespace Prescribing_System.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class DoctorController : Controller
    {
        public AdminDbContext Data = new AdminDbContext();
        public bool UserIsVerified(string role = "")
        {
            var session = new MySession(HttpContext.Session);
            var loggedUserRole = session.GetRole();
            if (loggedUserRole != "none" && loggedUserRole == role)
                return true;
            else
                return false;
        }
        public IActionResult Index()
        {
            IndexViewModel model = new IndexViewModel 
            { LoggedUser = UserSingleton.GetLoggedUser() };
            if (UserIsVerified("Admin"))
                return View(model);
            else
                return RedirectToAction("Index", "Home", new { area = "" });
        }
        [HttpGet]
        public IActionResult Add()
        {
            var model = new AddUserViewModel()
            {
                SelectedUser = new DoctorUser(),
            };
            ViewBag.MedPracs = Data.GetAllMedPracs();
            return View("User/Add", model);
        }
        [HttpPost]
        public IActionResult Add(AddDoctorViewModel model)
        {
            if (ModelState.IsValid)
            {
                ViewBag.Message = "User added";
                ViewBag.Area = "Admin";
                ViewBag.Ctrl = "User";
                ViewBag.Action = "Index";
                bool result = Data.AddDoctor(model);
                if (result)
                {
                    return View("Acknowledgement");
                }
                else
                {
                    ModelState.AddModelError("", "Error adding");
                    return View(model);
                }
            }
            ModelState.AddModelError("", "Invalid information entered.");
            return View(model);
        }
    }
}
