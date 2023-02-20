using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Models;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;

namespace ParticipationAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ParticipationController : ControllerBase
    {
        private readonly SportsEventManagementContext db;

        public ParticipationController(SportsEventManagementContext _db)
        {
            this.db = _db;
        }
        //Get all participations

        [HttpGet]
        public async Task<IActionResult> GetParticipations()
        {
            return Ok(await db.Participations.ToListAsync());
        }

        //GetById
        [HttpGet]
        [Route("GetParticipationById")]
        public async Task<ActionResult<Participation>> GetParticipationById(int id)
        {
            Participation p = await db.Participations.FindAsync(id);
            return Ok(p);
        }

        //Update or put
        [HttpPut]
        public async Task<IActionResult> UpdateParticipation(int id, Participation p)
        {
            db.Entry(p).State= EntityState.Modified;
            //db.Participations.Update(p); //here

            await db.SaveChangesAsync();
            return Ok();
        }
        //Addparicipations
        [HttpPost]

        public async Task<IActionResult> AddParticipation(Participation p)
        {
            db.Participations.Add(p);

            await db.SaveChangesAsync();
            return Ok();
        }

        /*[HttpGet]
        [Route("GetParticipationsApproved")]
        public async Task<ActionResult<Participation>> GetParticipationsApproved(string name)
        {
            List<Participation> p = await db.Participations.Where(x => x.Status == name).ToListAsync();
            return Ok(p);
        }*/

        [HttpGet]
        [Route("GetParticipationsByStatus")]
        public async Task<ActionResult<IEnumerable<Participation>>> GetPartcipationsByStatus(string name)
        {
            //Participation p = await db.Participations.FirstOrDefaultAsync(x => x.Status == name);
            // return Ok(p);
            //List<Participation> p = await db.Participations.Where(x => x.Status == name).ToListAsync();
            var p = await db.Participations.Where(x => x.Status == name).ToListAsync();
            return Ok(p);

        }
    }
}