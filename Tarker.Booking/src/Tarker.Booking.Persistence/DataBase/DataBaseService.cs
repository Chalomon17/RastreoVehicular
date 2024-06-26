﻿using Microsoft.EntityFrameworkCore;
using Tarker.Booking.Application.DataBase;
using Tarker.Booking.Domain.Entities.Cliente;
using Tarker.Booking.Domain.Entities.Libro;
using Tarker.Booking.Domain.Entities.Usuario;
using Tarker.Booking.Persistence.Configuration;

namespace Tarker.Booking.Persistence.DataBase
{
    /// <summary>
    /// Servicios para acceder a la Base de datos mediante DBContext de EntityFramework
    /// </summary>
    /// <remarks>
    /// Autor: Gonzalo Mata
    /// Fecha: 07/06/2024
    /// </remarks>
    public class DataBaseService: DbContext, IDataBaseService
    {
        /// <summary>
        /// Constructor para ingresar o recibir la cadena de conexión hacia la Base de datos.
        /// </summary>
        /// <param name="options"></param>
        /// <remarks>
        /// Autor: Gonzalo Mata
        /// Fecha: 07/06/2024
        /// </remarks>
        public DataBaseService(DbContextOptions options): base(options) {
          
        }

        /// <summary>
        /// Invocación a la tabla a través de la entidad Usuario.
        /// </summary>
        public DbSet<UsuarioEntity> Usuario { get; set; }
        /// <summary>
        /// Invocación a la tabla a través de la entidad Cliente.
        /// </summary>
        public DbSet<ClienteEntity> Cliente { get; set; }
        /// <summary>
        /// Invocación a la tabla a través de la entidad Libro.
        /// </summary>
        public DbSet<LibroEntity> Libro { get; set; }

        /// <summary>
        /// Invocación del servicio asíncrono si a guardado o no los cambios.
        /// </summary>
        /// <returns>Devuelve un entero, el número de registros modificados.</returns>
        public async Task<bool> SaveAsync()
        {
            return await SaveChangesAsync() > 0;
        }

        /// <summary>
        /// Método para invocar cuando se está creando el modelo de datos para el contexto
        /// de la base de datos. Se utiliza para configurar las entidades y sus
        /// relaciones.
        /// </summary>
        /// <param name="modelBuilder"></param>
        /// <remarks>
        /// Autor: Gonzalo Mata
        /// Fecha: 07/06/2024
        /// </remarks>
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            EntityConfiguration(modelBuilder);
        }

        /// <summary>
        /// Método para aplicar toda la configuración de los modelos de datos.
        /// </summary>
        /// <param name="modelBuilder"></param>
        /// <remarks>
        /// Autor: Gonzalo Mata
        /// Fecha: 07/06/2024
        /// </remarks>
        private void EntityConfiguration(ModelBuilder modelBuilder)
        {
            new UsuarioConfiguracion(modelBuilder.Entity<UsuarioEntity>());
            new ClienteConfiguracion(modelBuilder.Entity<ClienteEntity>());
            new LibroConfiguracion(modelBuilder.Entity<LibroEntity>());
        }



    }
}
