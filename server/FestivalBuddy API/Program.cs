using FestivalBuddy_API.Hubs;
using FestivalBuddy_API.Logic;
using FestivalBuddy_API.Notifiers;
using FestivalBuddy_API.Repository;
using FestivalBuddy_BLL.Logic;
using FestivalBuddy_Common.Interface;
using FestivalBuddy_DAL;
using FestivalBuddy_DAL.Repository;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
var connectionString =
    builder.Configuration.GetConnectionString("DefaultConnection");

builder.Services.AddDbContext<FestivalBuddyContext>(options =>
    options.UseNpgsql(connectionString));

builder.Services.AddSignalR();



builder.Services.AddControllers();
// Learn more about configuring OpenAPI at https://aka.ms/aspnet/openapi
builder.Services.AddOpenApi();
builder.Services.AddScoped<EventService>();
builder.Services.AddScoped<IEventRepository, EventRepository>();
builder.Services.AddScoped<SyncMetaService>();
builder.Services.AddScoped<ISyncMetadataRepository, SyncMetadataRepository>();
builder.Services.AddScoped<ISyncNotifier, SignalRSyncNotifier>();

var app = builder.Build();

app.MapHub<SyncHub>("/syncHub");

using (var scope = app.Services.CreateScope())
{
    var db = scope.ServiceProvider.GetRequiredService<FestivalBuddyContext>();
    db.Database.EnsureCreated();
}

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.MapOpenApi();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
