using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using moviesdb.Models;

namespace moviesdb.Controllers
{
    public class MoviesController : ApiController
    {
        Movie[] movies = new Movie[]
              {
            new Movie { Id = 1, Name = "Titanic", Genre = "Drama", Price = 9 },
            new Movie { Id = 2, Name = "Rocky", Genre = "Drama", Price = 5.75M },
            new Movie { Id = 3, Name = "Team America", Genre = "Comedy", Price = 8.99M }
              };

        public IEnumerable<Movie> GetAllMovies()
        {
            return movies;
        }

        public IHttpActionResult GetMovie(int id)
        {
            var movie = movies.FirstOrDefault((p) => p.Id == id);
            if (movie == null)
            {
                return NotFound();
            }
            return Ok(movie);
        }
    }


}
