using Microsoft.AspNetCore.Mvc;



namespace SampleApi.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class PersonsController : ControllerBase
    {
        [HttpGet]
        public IActionResult Get()
        {   
            var persons = new string []{
                "Edsel",
                "Nixon",
                "Dotty",
                "Verlinda",
                "Jevy",
                "Cliff",
                "Katoi"
                
            };
            return Ok(persons);
        }
    }
}