var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.MapGet("/", () => new
{
    message = "Hello from the API pod!",
    pod = Environment.MachineName
});

app.MapGet("/health", () => Results.Ok("healthy"));

app.Run();
